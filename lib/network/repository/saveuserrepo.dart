import 'package:cloud_kitchen/network/client/networkclient.dart';
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/request/SaveCustomer.dart';
import 'package:cloud_kitchen/network/model/response/SaveUser.dart';
import 'package:dio/dio.dart';
import 'package:cloud_kitchen/network/base/endPoint.dart' as endPoints;
import 'package:flutter/material.dart';


class SaveUserRepo{
  HttpClient httpClient;

SaveUserRepo(){
  httpClient=HttpClient();
}

 
 Future<HttpResponse> saveUser(SaveCustomer saveUser) async {
   HttpResponse httpResponse = HttpResponse();


   await httpClient.post(endPoints.Auth().saveUser, body: {
      "custId": saveUser.custId,
      "custName":'${saveUser.custName}',
      "phoneNumber": saveUser.phoneNumber,
      "whatsappNo": saveUser.whatsappNo,
      "emailId": saveUser.emailId,
      "profilePic": saveUser.profilePic,
      "gender": saveUser.gender,
      "custDob": saveUser.custDob,
      "ageGroup": saveUser.ageGroup,
      "compId": saveUser.compId,
      "cityId": saveUser.cityId,
      "frId": saveUser.frId,
      "isBuissHead": saveUser.isBuissHead,
      "companyName": saveUser.companyName,
      "gstNo": saveUser.gstNo,
      "address": saveUser.address,
      "isActive": saveUser.isActive,
      "delStatus": saveUser.delStatus,
      "custAddPlatform": saveUser.custAddPlatform,
      "custAddDatetime": saveUser.custAddDatetime,
      "addedFromType": saveUser.addedFromType,
      "userId": saveUser.userId,
      "isPremiumCust": saveUser.isPremiumCust,
      "exInt1": saveUser.exInt1,
      "exInt2": saveUser.exInt2,
      "exInt3": saveUser.exInt3,
      "exInt4": saveUser.exInt4,
      "exInt5": saveUser.exInt5,
      "exVar1": saveUser.exVar1,
      "exVar2": saveUser.exVar2,
      "exVar3": saveUser.exVar3,
      "exVar4": saveUser.exVar4,
      "exVar5": saveUser.exVar5,
      "exFloat1": saveUser.exFloat1,
      "exFloat2": saveUser.exFloat2,
      "exFloat3": saveUser.exFloat3,
      "exFloat4": saveUser.exFloat4,
      "exFloat5": saveUser.exFloat5
    }).then((responce) {

      print(responce);
      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.info=Info.fromJson(responce.data['info']);

        if(!httpResponse.info.error){
          httpResponse.data = SaveUser.fromJson(responce.data['customer']);
        }
      } else {
        httpResponse.status = 500;
        httpResponse.message = 'Something went wrong';
        httpResponse.data = null;
      }
    }).catchError((onError) {
      print(onError);
      httpResponse.status = 404;
      httpResponse.message = 'Network not available';
      httpResponse.data = null;
    });

    return httpResponse;
  }



  Future<HttpResponse> getUserDetails(String  mobile) async {
    HttpResponse httpResponse = HttpResponse();


    await httpClient.post('${endPoints.Auth().mobileVerification}?mobileNo=$mobile').then((responce) {

      print(responce);
      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.info=Info.fromJson(responce.data['info']);

        if(!httpResponse.info.error) {
          try {
            httpResponse.data =
                SaveUser.fromJson(responce.data['customerDisplay']);
          } catch (error) {
            httpResponse.info.error = true;
            httpResponse.info.messege = 'no user data available';
          }
        }
      } else {
        httpResponse.status = 500;
        httpResponse.message = 'Something went wrong';
        httpResponse.data = null;
      }
    }).catchError((onError) {
      print(onError);
      httpResponse.status = 404;
      httpResponse.message = 'Network not available';
      httpResponse.data = null;
    });

    return httpResponse;
  }



}