import 'dart:async';

import 'package:cloud_kitchen/local/prefs.dart';
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/request/SaveCustomer.dart';
import 'package:cloud_kitchen/network/model/response/SaveUser.dart';
// import 'package:cloud_kitchen/network/model/response/distancematrics/distancematricsone.dart';
import 'package:cloud_kitchen/network/repository/saveuserrepo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
import 'package:regexpattern/regexpattern.dart';
part 'profileDetailsViewModel.g.dart';

class ProfileDetailsViewModel =_ProfileDetailsViewModel with _$ProfileDetailsViewModel;


abstract class _ProfileDetailsViewModel with Store{


  final ProfileDetailsErrorState profileDetailsErrorState=ProfileDetailsErrorState();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn googleSignIn = GoogleSignIn();

  SaveUserRepo saveUserRepo;
  MyLocalPrefes myLocalPrefes;

  _ProfileDetailsViewModel(){

    myLocalPrefes=MyLocalPrefes();
    saveUserRepo=SaveUserRepo();

  }




  @observable
  UserCredential result;


  @observable
  String username='';


  @observable
  String email='';

  @observable
  String phoneNumber='';

  @observable
  String address='';

  @observable
  int gender=0;

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
  String getCusPhone(){
    return myLocalPrefes.getCustPhone();
  }

  @action
  int getCustID(){
    return myLocalPrefes.getCustId();
  }





  @action
  validateUsername(String text) {
    return text.isEmpty
        ? profileDetailsErrorState.username = 'Please Enter Username'
        : profileDetailsErrorState.username = null;
  }

  @action
  validatePassword(String text) {
    return text.isEmpty||text.isEmail()
        ? profileDetailsErrorState.email = null
        : profileDetailsErrorState.email = null;
  }


  @action
  validatePhoneNumber(String text) {
    return text.isEmpty||text.isPhone()
        ? profileDetailsErrorState.phoneNumber = null
        : profileDetailsErrorState.phoneNumber = null;
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
          isLoading=false;

          return true;
        }

      }else if(httpResponse.status==500) {
        errorMessage=httpResponse.message;
        isLoading=false;

      return false;
      }
      isLoading=false;


  }

  void getUserDetailsIfExist(){
    String mobile;

    isLoading=true;
    Future.delayed(Duration(seconds: 1)).then((value) => {
    saveUserRepo.getUserDetails(myLocalPrefes.getCustPhone()).then((value)
    {
    isLoading=false;
    if(value.status==200){

    if(!value.info.error) {
    customerDetails = value.data;
    username = customerDetails.custName;
    email = customerDetails.emailId;
    phoneNumber = customerDetails.phoneNumber;
    address = customerDetails.address;
    gender = customerDetails.gender;

    }
    }else if(value.status==500) {
    errorMessage=value.message;
    }

    } ).catchError((onError){
    isLoading=false;

    }),


    });

  }



}

class ProfileDetailsErrorState = _ProfileDetailsErrorState with _$ProfileDetailsErrorState;

abstract class _ProfileDetailsErrorState with Store {
  @observable
  String username = null;

  @observable
  String email = null;

  @observable
  String phoneNumber = null;

  @observable
  String address = null;

  @observable
  int gender = null;

  @computed
  bool get hasErrors => username!= null || email != null;
}
