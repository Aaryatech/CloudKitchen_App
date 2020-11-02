import 'package:cloud_kitchen/network/model/request/SaveCustomer.dart';
import 'package:cloud_kitchen/network/model/response/SaveUser.dart';
import 'package:cloud_kitchen/network/repository/saveuserrepo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
part 'personaldetailsviewmodel.g.dart';

class PersonalDetailsViewModel =_PersonalDetailsViewModel with _$PersonalDetailsViewModel;


abstract class _PersonalDetailsViewModel with Store{


  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  SaveUserRepo saveUserRepo;


  _PersonalDetailsViewModel(){

    saveUserRepo=SaveUserRepo();
  }


  @observable
  UserCredential result;

  @observable
  SaveCustomer customerDetails;

  @observable
  bool loginStatus=false;


  @observable
  String errorMessage='';



  @observable
  bool isLoadingForLogin=false;


  @observable
  bool isLoading=false;



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
    isLoadingForLogin=false;

 }


  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    isLoadingForLogin=true;

    final LoginResult loginresult = await FacebookAuth.instance.login(permissions: ['email','name']);

    // Create a credential from the access token
    final AuthCredential facebookAuthCredential =
    FacebookAuthProvider.credential(loginresult.accessToken.token);

    // Once signed in, return the UserCredential
    result  =  (await _auth.signInWithCredential(facebookAuthCredential));

    isLoadingForLogin=true;
  }

  void saveUserDetails(SaveCustomer saveUserDetails){
    isLoading=true;
    saveUserRepo.saveUser(saveUserDetails).then((value)  {
      if(value.status==200){
        customerDetails=value.data;
      }else if(value.status==500) {
        errorMessage=value.message;
      }
      isLoading=false;
    }).catchError((onError){
      isLoading=false;
      errorMessage=onError.toString();
    });
  }



}