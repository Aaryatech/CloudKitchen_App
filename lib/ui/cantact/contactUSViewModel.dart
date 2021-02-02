import 'dart:async';

import 'package:cloud_kitchen/local/prefs.dart';
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/request/SaveCustomer.dart';
import 'package:cloud_kitchen/network/repository/saveuserrepo.dart';
import 'package:cloud_kitchen/ui/cantact/ContactUs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:regexpattern/regexpattern.dart';
part 'contactUSViewModel.g.dart';

class ContactUSViewModel = _ContactUSViewModel with _$ContactUSViewModel;

abstract class _ContactUSViewModel with Store {
  final ContactUSErrorState contactUSErrorState = ContactUSErrorState();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn googleSignIn = GoogleSignIn();

  SaveUserRepo saveUserRepo;
  MyLocalPrefes myLocalPrefes;

  _ContactUSViewModel() {
    myLocalPrefes = MyLocalPrefes();
    saveUserRepo = SaveUserRepo();
  }

  @observable
  UserCredential result;

  @observable
  HttpResponse httpResponseMian = HttpResponse();

  @observable
  String error;

  // @observable
  // int gender;

  @observable
  ContactUs customerDetails;

  @observable
  bool loginStatus = false;

  @observable
  String errorMessage = '';

  @observable
  bool isLoadingForLogin = false;

  @observable
  bool isLoading = false;

  @action
  Future<String> getCusPhone() async {
    return await myLocalPrefes.getCustPhone();
  }

  @action
  validateUsername(String text) {
    return text.isEmpty
        ? contactUSErrorState.username = 'Please Enter Username'
        : contactUSErrorState.username = null;
  }

  @action
  validateMessage(String text) {
    return text.isEmpty
        ? contactUSErrorState.username = 'Please Enter Message'
        : contactUSErrorState.username = null;
  }

  @action
  validateEmail(String text) {
    return text.isEmpty || !text.isEmail()
        ? contactUSErrorState.email = 'Enter Valid Email Id'
        : contactUSErrorState.email = null;
  }

  @action
  validatePhone(String text) {
    return text.isEmpty || !text.isPhone()
        ? contactUSErrorState.email = 'Enter Valid Phone Number'
        : contactUSErrorState.email = null;
  }

//   @action
//   Future signInWithGoogle() async {
//     isLoadingForLogin=true;
//     await Firebase.initializeApp();

//     final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//     final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

//     final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleSignInAuthentication.accessToken,
//       idToken: googleSignInAuthentication.idToken,
//     );

//     result= await _auth.signInWithCredential(credential);

//     username= result.user.displayName;
//     email= result.user.email;

//     isLoadingForLogin=false;

//  }

  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   isLoadingForLogin=true;

  //   final LoginResult loginresult = await FacebookAuth.instance.login(permissions: ['email','name']);

  //   // Create a credential from the access token
  //   final AuthCredential facebookAuthCredential =
  //   FacebookAuthProvider.credential(loginresult.accessToken.token);

  //   // Once signed in, return the UserCredential
  //   result  =  (await _auth.signInWithCredential(facebookAuthCredential));
  //   username= result.user.displayName;
  //   email= result.user.email;
  //   isLoadingForLogin=true;
  // }

  Future saveContactUS(SaveCustomer saveUserDetails) async {
    isLoading = true;

    HttpResponse httpResponse =
        await saveUserRepo.saveContactUs(saveUserDetails);
    if (httpResponse.status == 200) {
      if (!httpResponse.info.error) {
        httpResponseMian = httpResponse;
      }
    } else if (httpResponse.status == 500) {
      errorMessage = httpResponse.message;
    }
    isLoading = false;
  }

//   void getUserDetailsIfExist(){
//     String mobile;
//     // Timer(Duration(milliseconds: 700), (){
//     //   mobile = myLocalPrefes.getCustPhone();

//     // });

//     // mobile = getCusPhone();
//     isLoading=true;
//     saveUserRepo.getUserDetails('7741919844').then((value)
//  {
//    isLoading=false;
//    if(value.status==200){

//      if(!value.info.error) {
//        customerDetails = value.data;
//        username = customerDetails.custName;
//        email = customerDetails.emailId;
//        phoneNumber = customerDetails.phoneNumber;
//       //  address = customerDetails.address;
//       //  gender = customerDetails.gender;

//      }
//      }else if(value.status==500) {
//      errorMessage=value.message;
//    }

//  } ).catchError((onError){
//       isLoading=false;

//     });

//   }

}

class ContactUSErrorState = _ContactUSErrorState with _$ContactUSErrorState;

abstract class _ContactUSErrorState with Store {
  @observable
  String username;

  @observable
  String email;

  @observable
  String phoneNumber;

  @observable
  String message;

  // @observable
  // int gender = null;

  @computed
  bool get hasErrors => username != null || email != null;
}
