

import 'package:cloud_kitchen/network/client/networkclient.dart';
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/response/franchiseoffers/offersmain.dart';
import 'package:dio/dio.dart';
import 'package:cloud_kitchen/network/base/endPoint.dart' as endPoints;

class AdditionalChargesAndOffersRepo{
  HttpClient httpClient;

  AdditionalChargesAndOffersRepo(){
    httpClient=HttpClient();
  }



  Future<HttpResponse> getAdditionChargesAnadOffers(String frId,int custId,int km) async{
    HttpResponse httpResponse=HttpResponse();

    String params='?frId=$frId&custId=$custId&applicableFor=1&km=$km';

    Response responce=await httpClient.post('${endPoints.Auth().additionaCharges}$params');
     print(responce.data);
    try{
      if(responce.statusCode==200){
        httpResponse.status=responce.statusCode;
        httpResponse.message='Successful';
         httpResponse.data=OffersMain.fromJson(responce.data);
      

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