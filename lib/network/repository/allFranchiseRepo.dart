

import 'package:cloud_kitchen/network/client/networkclient.dart';
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/response/Franchise.dart';
import 'package:cloud_kitchen/network/base/endPoint.dart' as endPoints;
import 'package:cloud_kitchen/network/model/response/FranchiseId.dart';
import 'package:cloud_kitchen/network/model/response/franchiseMain.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AllFranchiseRepo{
  HttpClient httpClient;

AllFranchiseRepo(){
  httpClient=HttpClient();
}

 
 Future<HttpResponse> allFranchise() async{
   HttpResponse httpResponse=HttpResponse();


   Response responce=await httpClient.get(endPoints.Auth().allFranchise);
     // print(responce.data);
try{
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
  
   }catch(onError){
       httpResponse.status= 400;
       httpResponse.message='Network not available';
       httpResponse.data=onError.toString();
     return httpResponse;
   }
}


  Future<HttpResponse> getFranchiseDetailsById(String id)async{
    HttpResponse httpResponse=HttpResponse();

    String param='?frId=$id&type=2&applicableFor=2&compId=1';

    Response responce=await httpClient.post('${endPoints.Auth().homeData}$param');
    // print(responce.data);

    try{
      if(responce.statusCode==200){
        httpResponse.status=responce.statusCode;
        httpResponse.message='Successful';
        httpResponse.data=FranchiseId.fromJson(responce.data);
        httpResponse.info=Info.fromJson(responce.data['info']);

      }else{
        httpResponse.status= 500;
        httpResponse.message='Something went wrong';
        httpResponse.data=null;

      }
      return httpResponse;

    }catch(onError){
      httpResponse.status= 400;
      httpResponse.message='Network not available';
      httpResponse.data=onError.toString();
      return httpResponse;
    }


  }


  Future<HttpResponse> getFranchiseDetailsSorted(int frId,int sortId)async{
    HttpResponse httpResponse=HttpResponse();

    String param='?frId=$frId&sort=$sortId';

    Response responce=await httpClient.post('${endPoints.Auth().franchiseDatabySort}$param');
    // print(responce.data);

    try{
      if(responce.statusCode==200){
        httpResponse.status=responce.statusCode;
        httpResponse.message='Successful';
        httpResponse.data=FranchiseId.fromJson(responce.data);
        httpResponse.info=Info.fromJson(responce.data['info']);

      }else{
        httpResponse.status= 500;
        httpResponse.message='Something went wrong';
        httpResponse.data=null;

      }
      return httpResponse;

    }catch(onError){
      httpResponse.status= 400;
      httpResponse.message='Network not available';
      httpResponse.data=onError.toString();
      return httpResponse;
    }
  }

  Future<HttpResponse> getFranchiseDetailsRating(int frId,String rating)async{
    HttpResponse httpResponse=HttpResponse();

    String param='?frId=$frId&ratings=$rating';

    Response responce=await httpClient.post('${endPoints.Auth().franchiseDatabyRating}$param');


    try{
      if(responce.statusCode==200){
        httpResponse.status=responce.statusCode;
        httpResponse.message='Successful';
        httpResponse.data=FranchiseId.fromJson(responce.data);
        httpResponse.info=Info.fromJson(responce.data['info']);

      }else{
        httpResponse.status= 500;
        httpResponse.message='Something went wrong';
        httpResponse.data=null;

      }
      return httpResponse;

    }catch(onError){
      httpResponse.status= 400;
      httpResponse.message='Network not available';
      httpResponse.data=onError.toString();
      return httpResponse;
    }
  }



}