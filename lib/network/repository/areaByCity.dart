
import 'package:cloud_kitchen/network/client/networkclient.dart';
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:dio/dio.dart';
import 'package:cloud_kitchen/network/base/endPoint.dart' as endPoints;

import 'package:cloud_kitchen/network/model/response/AreaListByCityId.dart';

class AreaByCity{

HttpClient httpClient;

AreaByCity(){
  httpClient=HttpClient();
}

 
 Future<HttpResponse> areaByCity(int cityId) async{
   HttpResponse httpResponse=HttpResponse();
    
FormData formData = new FormData.fromMap({
    "cityId": cityId
    
  });

   await httpClient.post(endPoints.Auth().areaByCity,body:formData).then((responce){
     if(responce.statusCode==200){
       httpResponse.status=responce.statusCode;
       httpResponse.message='Successful';
       httpResponse.data=AreaListByCityId.fromJson(responce.data);
     
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