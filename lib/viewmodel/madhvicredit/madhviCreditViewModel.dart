import 'dart:async';

import 'package:cloud_kitchen/local/prefs.dart';
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/request/SaveCustomer.dart';
import 'package:cloud_kitchen/network/model/response/MadhviCredit.dart';
import 'package:cloud_kitchen/network/model/response/SaveUser.dart';
import 'package:cloud_kitchen/network/repository/madhviCreditRepo.dart';
// import 'package:cloud_kitchen/network/model/response/distancematrics/distancematricsone.dart';
import 'package:cloud_kitchen/network/repository/saveuserrepo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
import 'package:regexpattern/regexpattern.dart';
part 'madhviCreditViewModel.g.dart';

class MadhviCreditViewModel =_MadhviCreditViewModel with _$MadhviCreditViewModel;


abstract class _MadhviCreditViewModel with Store{


  final MadhviCreditErrorState madhviCreditErrorState = MadhviCreditErrorState();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn googleSignIn = GoogleSignIn();

  MadhviCreditRepo madhviCreditRepo;
  MyLocalPrefes myLocalPrefes;

  _MadhviCreditViewModel(){

    myLocalPrefes=MyLocalPrefes();
    madhviCreditRepo = MadhviCreditRepo(); 

  }


  @observable
  UserCredential result;


  @observable
  String username;


 @observable
  double total=0;


  @observable
  String email;

  @observable
  String phoneNumber;

  @observable
  String message;

  // @observable
  // int gender;

  @observable
  MadhviCreditList madhviCreditList;

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
      // reaction((_) => username, validateUsername),
      // reaction((_) => email, validateEmail),
      // reaction((_) => phoneNumber, validatePhone),
      // reaction((_) => message, validateMessage)
    ];
  }

  @action
  int getCusId(){
    return myLocalPrefes.getCustId();
  }





  

  // Future<bool> saveUserDetails(SaveCustomer saveUserDetails) async {
  //   isLoading=true;
  //  HttpResponse httpResponse=  await saveUserRepo.saveUser(saveUserDetails);
  //     if(httpResponse.status==200){

  //       if(!httpResponse.info.error)
  //       {
  //         customerDetails=httpResponse.data;
  //         print(customerDetails.custName);
  //         myLocalPrefes.setCustId(customerDetails.custId);
  //         myLocalPrefes.setCustDetails(true);
  //         myLocalPrefes.setCustName(customerDetails.custName);
  //       return true;
  //       }

  //     }else if(httpResponse.status==500) {
  //       errorMessage=httpResponse.message;
  //     return false;
  //     }
  //     isLoading=false;


  // }

  void getMadhviCredit(){
    int custId;
    // Timer(Duration(milliseconds: 700), (){
    //   mobile = myLocalPrefes.getCustPhone();
    
    // });

    // custId = getCusId();
    isLoading=true;

    Future.delayed(Duration(seconds: 1)).then((value) => {

    madhviCreditRepo.madhviCredit('${getCusId()}').then((value)
    {

    if(value.status==200){

    if (!value.info.error) {
    madhviCreditList = value.data;

    madhviCreditList.walletTransaction.forEach((element) {
    if(element.transcType=="CR"){
    total=total+element.amount;
    }else{
    total=total-element.amount;

    }


    });

    isLoading=false;

    //  print(madhviCredit.amount);
    }
    //  username = customerDetails.custName;
    //  email = customerDetails.emailId;
    //  phoneNumber = customerDetails.phoneNumber;
    //  address = customerDetails.address;
    //  gender = customerDetails.gender;
    }else if(value.status==500) {
    errorMessage=value.message;
    isLoading=false;
    }

    } ).catchError((onError){
    isLoading=false;

    })



    });
  }



}

class MadhviCreditErrorState = _MadhviCreditErrorState with _$MadhviCreditErrorState;

abstract class _MadhviCreditErrorState with Store {
  @observable
  String username = null;

  @observable
  String email = null;

  @observable
  String phoneNumber = null;

  @observable
  String message = null;


  @observable
  MadhviCreditList  madhviCreditList = null;
  // @observable
  // int gender = null;

  @computed
  bool get hasErrors => username!= null || email != null;
}
