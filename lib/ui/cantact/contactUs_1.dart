import 'package:cloud_kitchen/network/client/networkclient.dart';
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/request/SaveCustomer.dart';
import 'package:cloud_kitchen/network/model/response/SaveUser.dart';
import 'package:cloud_kitchen/ui/cantact/ContactUs.dart';
import 'package:dio/dio.dart';
import 'package:cloud_kitchen/network/base/endPoint.dart' as endPoints;
import 'package:flutter/material.dart';


class SaveUserRepo{
  HttpClient httpClient;

SaveUserRepo(){
  httpClient=HttpClient();
}


   Future<HttpResponse> saveContactUs(SaveCustomer saveUser) async {
   HttpResponse httpResponse = HttpResponse();


   await httpClient.post(endPoints.Auth().saveUser, body: {
      "name":'${saveUser.custName}',
      "number": saveUser.phoneNumber,
      "msg": saveUser.msg,
      "email": saveUser.emailId
    }).then((responce) {

      print(responce);
      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
          httpResponse.data = ContactUs.fromJson(responce.data);
        
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