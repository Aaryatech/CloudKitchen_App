
import 'dart:convert';

import 'package:cloud_kitchen/local/prefs.dart';
import 'package:cloud_kitchen/network/client/networkclient.dart';
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/request/SaveAddress.dart';
import 'package:cloud_kitchen/network/model/response/CustomerAddress.dart';
import 'package:dio/dio.dart';
import 'package:cloud_kitchen/network/base/endPoint.dart' as endPoints;
import 'package:flutter/material.dart';


class CustomerAddressRepo{

HttpClient httpClient;
MyLocalPrefes myLocalPrefes;

CustomerAddressRepo(){
  httpClient=HttpClient();
  myLocalPrefes=MyLocalPrefes();
}

 
 Future<HttpResponse> getCustomerAddresss(int custId) async{
   HttpResponse httpResponse=HttpResponse();
    
 String params="?custId=$custId";
    


   await httpClient.post(endPoints.Auth().custAddress+params).then((responce){
     if(responce.statusCode==200){
       httpResponse.status=responce.statusCode;
       httpResponse.message='Successful';
       httpResponse.data=CustomerAddressMain.fromJson(responce.data);
       httpResponse.info=Info.fromJson(responce.data['info']);
     }else{
       httpResponse.status= 500;
       httpResponse.message='Something went wrong';
       httpResponse.data=null;
     
     }
   }).catchError((onError) {
      print(onError);
      httpResponse.status = 404;
      httpResponse.data = null;
      httpResponse.message = 'Network not available';
    });
    return httpResponse;
  }

Future<HttpResponse> gsaveCustomerAddresss(SaveAddress saveAddress) async{
  HttpResponse httpResponse=HttpResponse();

  await httpClient.post(endPoints.Auth().saveCustomer,body: {
    "custAddressId": saveAddress.custAddressId,
    "custId": saveAddress.custId,
    "addressCaption": saveAddress.addressCaption,
    "address": saveAddress.address,
    "areaId": saveAddress.areaId,
    "area": saveAddress.area,
    "landmark": saveAddress.landmark,
    "pincode": saveAddress.pincode,
    "cityId": saveAddress.cityId,
    "delStatus": saveAddress.delStatus,
    "latitude": saveAddress.latitude,
    "longitude": saveAddress.longitude,
    "exInt1": saveAddress.exInt1,
    "exInt2": saveAddress.exInt2,
    "exInt3": saveAddress.exInt3,
    "exVar1": saveAddress.exVar1,
    "exVar2": saveAddress.exVar2,
    "exVar3": saveAddress.exVar3,
    "exFloat1": saveAddress.exFloat1,
    "exFloat2": saveAddress.exFloat2,
    "exFloat3": saveAddress.exFloat3
  }).then((responce){
    if(responce.statusCode==200){
      print(responce.data);
      httpResponse.status=responce.statusCode;
      httpResponse.message='Successful';
      httpResponse.info=Info.fromJson(responce.data);
      if(httpResponse.info.error){
        myLocalPrefes.setAddressId(responce.data['message']);
        myLocalPrefes.setCustLocationCapture(true);
      }else{
        httpResponse.message=responce.data['message'];

      }
    }else{
      httpResponse.status= 500;
      httpResponse.message='Something went wrong';
      httpResponse.data=null;

    }
  }).catchError((onError) {
    print(onError);
    httpResponse.status = 404;
    httpResponse.data = null;
    httpResponse.message = 'Network not available';
  });
  return httpResponse;
}

}