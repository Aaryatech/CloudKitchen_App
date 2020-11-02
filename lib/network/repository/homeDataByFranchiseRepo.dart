import 'package:cloud_kitchen/network/client/networkclient.dart';
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/response/FranchiseId.dart';
import 'package:dio/dio.dart';
import 'package:cloud_kitchen/network/base/endPoint.dart' as endPoints;


class HomeDataByFranchise{
  HttpClient httpClient;

HomeDataByFranchise(){
  httpClient=HttpClient();
}

 
 Future<HttpResponse> homeDataByFranchise(String frId,String type,String applicableFor,String compId) async{
   HttpResponse httpResponse=HttpResponse();
    
FormData formData = new FormData.fromMap({
    "frId": frId,
    "type": type,
    "applicableFor": applicableFor,
    "compId": compId
  });

   await httpClient.post(endPoints.Auth().homeData,body:formData).then((responce){
     if(responce.statusCode==200){
       httpResponse.status=responce.statusCode;
       httpResponse.message='Successful';
       httpResponse.data=FranchiseId.fromJson(responce.data);
     
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
