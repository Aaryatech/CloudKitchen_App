import 'package:cloud_kitchen/network/base/endPoint.dart' as endPoints;
import 'package:cloud_kitchen/network/client/networkclient.dart';
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/response/OrderHistory.dart';
import 'package:dio/dio.dart';

class OrderHistoryRepo{

  HttpClient httpClient;

  OrderHistoryRepo(){
    httpClient=HttpClient();
  }

  Future<HttpResponse> orderHistory(String custId) async{
    HttpResponse httpResponse=HttpResponse();


     String param= '?custId=$custId';


    await httpClient.post('${endPoints.Auth().orderHistory}$param').then((responce){
      print(responce);
      if(responce.statusCode==200){
        httpResponse.status=responce.statusCode;
        httpResponse.message='Successful';
          httpResponse.data=OrderHistory.fromJson(responce.data);


      }else{
        httpResponse.status= 500;
        httpResponse.message='Something went wrong';
        httpResponse.data=null;
        httpResponse.info.error=true;

      }
    }).catchError((onError) {
      print(onError);
      httpResponse.status = 404;
      httpResponse.data = null;
      httpResponse.info.error=true;
      httpResponse.message = 'Network not available';
    });
    return httpResponse;
  }



}