

import 'package:cloud_kitchen/network/client/networkclient.dart';
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/response/Franchise.dart';
import 'package:cloud_kitchen/network/base/endPoint.dart' as endPoints;
import 'package:cloud_kitchen/network/model/response/franchiseMain.dart';
import 'package:flutter/material.dart';

class AllFranchiseRepo{
  HttpClient httpClient;

AllFranchiseRepo(){
  httpClient=HttpClient();
}

 
 Future<HttpResponse> allFranchise() async{
   HttpResponse httpResponse=HttpResponse();


   await httpClient.get(endPoints.Auth().allFranchise).then((responce){
     // print(responce.data);
     if(responce.statusCode==200){
       httpResponse.status=responce.statusCode;
       httpResponse.message='Successful';
       httpResponse.data=FranchiseMain.fromJson(responce.data);
       httpResponse.info=Info.fromJson(responce.data['info']);

     }else{
       httpResponse.status= 500;
       httpResponse.message='Something went wrong';
       httpResponse.data=null;
     
     }
     return httpResponse;
  
   }).catchError((onError){
       httpResponse.status= 400;
       httpResponse.message='Network not available';
       httpResponse.data=onError.toString();
     return httpResponse;
   }); 

   return httpResponse;
 }


 Future<HttpResponse> getFranchiseDetailsById(String id) async{
   HttpResponse httpResponse=HttpResponse();


   await httpClient.get(endPoints.Auth().allFranchise).then((responce){
     // print(responce.data);
     if(responce.statusCode==200){
       httpResponse.status=responce.statusCode;
       httpResponse.message='Successful';
       httpResponse.data=FranchiseMain.fromJson(responce.data);
       httpResponse.info=Info.fromJson(responce.data['info']);

     }else{
       httpResponse.status= 500;
       httpResponse.message='Something went wrong';
       httpResponse.data=null;

     }
     return httpResponse;

   }).catchError((onError){
       httpResponse.status= 400;
       httpResponse.message='Network not available';
       httpResponse.data=onError.toString();
     return httpResponse;
   });

   return httpResponse;
 }





}