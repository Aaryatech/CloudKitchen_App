import 'package:cloud_kitchen/local/prefs.dart';
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/request/SaveCustomer.dart';
import 'package:cloud_kitchen/network/model/response/SaveUser.dart';
import 'package:cloud_kitchen/network/repository/saveuserrepo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
import 'package:regexpattern/regexpattern.dart';
part 'personaldetailsviewmodel.g.dart';

class PersonalDetailsViewModel =_PersonalDetailsViewModel with _$PersonalDetailsViewModel;


abstract class _PersonalDetailsViewModel with Store{


  final PersonalDetailsErrorState personalDetailsErrorState=PersonalDetailsErrorState();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  SaveUserRepo saveUserRepo;
  MyLocalPrefes myLocalPrefes;

  _PersonalDetailsViewModel(){

    myLocalPrefes=MyLocalPrefes();
    saveUserRepo=SaveUserRepo();

  }




  @observable
  UserCredential result;


  @observable
  String username="";


  @observable
  String email="";

  @observable
  String custDob="";


  @observable
  SaveUser customerDetails;

  @observable
  bool loginStatus=false;


  @observable
  String errorMessage='';



  @observable
  bool isLoadingForLogin=false;


  @observable
  bool isLoading=false;

  List<ReactionDisposer> _disposers;

  void setupValidations() {

    _disposers = [
      reaction((_) => username, validateUsername),
      reaction((_) => email, validatePassword)
    ];
  }



  @action
  setUserName(String usename) {
    username = usename;
  }
  @action
  setemial(String emial){
    email=emial;
  }


  @action
  validateUsername(String text) {
    return text.isEmpty
        ? personalDetailsErrorState.username = 'Please Enter Username'
        : personalDetailsErrorState.username = null;
  }

  @action
  validatePassword(String text) {
    return text.isEmpty||!text.isEmail()
        ? personalDetailsErrorState.email = 'Please enter valies Email'
        : personalDetailsErrorState.email = null;
  }

  @action
  Future signInWithGoogle() async {
    isLoadingForLogin=true;
    await Firebase.initializeApp();

    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    result= await _auth.signInWithCredential(credential);

    username= result.user.displayName;
    email= result.user.email;



    isLoadingForLogin=false;

  }


  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    isLoadingForLogin=true;

    final  loginresult = await FacebookAuth.instance.login(permissions: ['email','name']);

    // Create a credential from the access token
    final AuthCredential facebookAuthCredential =
    FacebookAuthProvider.credential(loginresult.token);

    // Once signed in, return the UserCredential
    result  =  (await _auth.signInWithCredential(facebookAuthCredential));
    username= result.user.displayName;
    email= result.user.email;
    isLoadingForLogin=true;
  }

  Future<bool> saveUserDetails(SaveCustomer saveUserDetails) async {
    isLoading=true;
    HttpResponse httpResponse=  await saveUserRepo.saveUser(saveUserDetails);
    if(httpResponse.status==200){

      if(!httpResponse.info.error)
      {
        customerDetails=httpResponse.data;
        print(customerDetails.custName);
        myLocalPrefes.setCustId(customerDetails.custId);
        myLocalPrefes.setCustDetails(true);
        myLocalPrefes.setCustName(customerDetails.custName);
        return true;
      }

    }else if(httpResponse.status==500) {
      errorMessage=httpResponse.message;
      return false;
    }
    isLoading=false;
  }

  void getUserDetailsIfExist(String mobile){

    isLoading=true;
    saveUserRepo.getUserDetails(mobile).then((value)
    {
      isLoading=false;
      if(value.status==200){

        if(!value.info.error) {
          customerDetails = value.data;
          username = customerDetails.custName;
          email = customerDetails.emailId;
          custDob=customerDetails.custDob;
        }
      }else if(value.status==500) {
        errorMessage=value.message;
      }

    } ).catchError((onError){
      isLoading=false;

    });

  }



}

class PersonalDetailsErrorState = _PersonalDetailsErrorState with _$PersonalDetailsErrorState;

abstract class _PersonalDetailsErrorState with Store {
  @observable
  String username = null;

  @observable
  String email = null;

  @computed
  bool get hasErrors => username!= null || email != null;
}
