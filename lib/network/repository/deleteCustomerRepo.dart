
import 'package:cloud_kitchen/network/client/networkclient.dart';
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/response/Info.dart';
import 'package:dio/dio.dart';
import 'package:cloud_kitchen/network/base/endPoint.dart' as endPoints;


class DeleteCustomerRepo{

HttpClient httpClient;

DeleteCustomerRepo(){
  httpClient=HttpClient();
}

 
 Future<HttpResponse> deleteCustomer(String custAddressId,String status) async{
   HttpResponse httpResponse=HttpResponse();
    
FormData formData = new FormData.fromMap({
    "custAddressId": custAddressId,
     "status": status
  });

   await httpClient.post(endPoints.Auth().deleteCustomerAddress,body:formData).then((responce){
     if(responce.statusCode==200){
       httpResponse.status=responce.statusCode;
       httpResponse.message='Successful';
       // httpResponse.data=Info.fromJson(responce.data);
     
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