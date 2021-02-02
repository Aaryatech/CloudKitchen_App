import 'dart:async';

import 'package:cloud_kitchen/local/prefs.dart';
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/request/SaveCustomer.dart';
import 'package:cloud_kitchen/network/model/response/GrievanceList.dart';
import 'package:cloud_kitchen/network/model/response/MadhviCredit.dart';
import 'package:cloud_kitchen/network/model/response/SaveUser.dart';
import 'package:cloud_kitchen/network/repository/grievanceListRepo.dart';
import 'package:cloud_kitchen/network/repository/madhviCreditRepo.dart';
// import 'package:cloud_kitchen/network/model/response/distancematrics/distancematricsone.dart';
import 'package:cloud_kitchen/network/repository/saveuserrepo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
import 'package:regexpattern/regexpattern.dart';
part 'greivanceViewModel.g.dart';

class GreivanceViewModel = _GreivanceViewModel with _$GreivanceViewModel;

abstract class _GreivanceViewModel with Store {
  final GreivanceErrorState greivanceErrorState = GreivanceErrorState();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn googleSignIn = GoogleSignIn();

  GrievanceListRepo grievancelistRepo;
  MyLocalPrefes myLocalPrefes;

  _GreivanceViewModel() {
    myLocalPrefes = MyLocalPrefes();
    grievancelistRepo = GrievanceListRepo();
  }

  @observable
  UserCredential result;

  @observable
  String username = '';

  @observable
  String email = '';

  @observable
  String phoneNumber = '';

  @observable
  String message = '';

  // @observable
  // int gender;

  @observable
  GrievanceListMain grievanceListMain;

  @observable
  bool loginStatus = false;

  @observable
  String errorMessage = '';

  @observable
  bool isLoadingForLogin = false;

  @observable
  bool isLoading = true;

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
  int getCusId() {
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

  Future getGrievanceList() async {
    isLoading = true;

    Future.delayed(Duration(milliseconds: 1000)).then((value) async {
      HttpResponse httpResponse =
          await grievancelistRepo.getGreivance('${getCusId()}');
      {
        if (httpResponse.status == 200) {
          if (!httpResponse.info.error) {
            grievanceListMain = httpResponse.data;
            //  print(madhviCredit.amount);
          }
          //  username = customerDetails.custName;
          //  email = customerDetails.emailId;
          //  phoneNumber = customerDetails.phoneNumber;
          //  address = customerDetails.address;
          //  gender = customerDetails.gender;
        } else if (httpResponse.status == 500) {
          errorMessage = httpResponse.message;
        }
        isLoading = false;
      }
    });
  }
}

class GreivanceErrorState = _GreivanceErrorState with _$GreivanceErrorState;

abstract class _GreivanceErrorState with Store {
  @observable
  String username = null;

  @observable
  String email = null;

  @observable
  String phoneNumber = null;

  @observable
  String message = null;

  @observable
  GrievanceList grievanceList = null;
  // @observable
  // int gender = null;

  @computed
  bool get hasErrors => username != null || email != null;
}
