
import 'package:cloud_kitchen/network/client/networkclient.dart';
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/response/DeliveryInstruction.dart';
import 'package:dio/dio.dart';
import 'package:cloud_kitchen/network/base/endPoint.dart' as endPoints;


class DeliveryInstructionRepo{

HttpClient httpClient;

DeliveryInstructionRepo(){
  httpClient=HttpClient();
}

 
 Future<HttpResponse> deliveryinstruction() async{
   HttpResponse httpResponse=HttpResponse();

   String param= "?compId=1";

  Response responce=await httpClient.post('${endPoints.Auth().deliverInstruction}$param');
    print(responce);
     if(responce.statusCode==200){
       httpResponse.status=responce.statusCode;
       httpResponse.message='Successful';
       httpResponse.data=DeliveryInstructionMain.fromJson(responce.data);
       httpResponse.info=Info.fromJson(responce.data['info']);

     }else{
       httpResponse.status= 500;
       httpResponse.message='Something went wrong';
       httpResponse.data=null;
       httpResponse.info=Info.fromJson(responce.data['info']);

     }

    return httpResponse;
  }

}