import 'package:cloud_kitchen/network/client/networkclient.dart';
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/request/PlaceOrder/PlaceOrder.dart';
import 'package:cloud_kitchen/network/model/response/placeorder/placeordermain.dart';
import 'package:cloud_kitchen/network/base/endPoint.dart' as endPoints;
import 'package:dio/dio.dart';


class OrderRepo{

  HttpClient httpClient;

  OrderRepo(){
    httpClient=HttpClient();
  }


  Future<HttpResponse> placeOredr(PlaceOrder placeOrderdata) async{
    HttpResponse httpResponse=HttpResponse();

    // FormData formData = new FormData.fromMap(placeOrderdata.toJson());

    await httpClient.post(endPoints.Auth().placeOrder,body:placeOrderdata.toJson()).then((responce){
      print(responce.toString());
      if(responce.statusCode==200){
        httpResponse.status=responce.statusCode;
        httpResponse.message='Successful';
        httpResponse.data=PlaceOrderModel.fromJson(responce.data);

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

  Future<HttpResponse> updatePaymentStatus(String orderId,String status,String paid,dynamic txStatus) async{
    HttpResponse httpResponse=HttpResponse();

    String param="?orderId=$orderId&status=$status&paid=$paid&txStatus=$txStatus";
    await httpClient.post(endPoints.Auth().updatePaymentAfterSuccess+param).then((responce){
      print(responce.toString());
      if(responce.statusCode==200){
        httpResponse.status=responce.statusCode;
        httpResponse.message=responce.data['message'];
        // httpResponse.data=PlaceOrderModel.fromJson(responce.data);

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


  Future<HttpResponse> cancelorder(String orderId,String custId) async{
    HttpResponse httpResponse=HttpResponse();
    // http://107.180.91.43:8080/ckwebapi/changeStatusByOrderId
    String param="?status=8&userId=$orderId&orderId=$orderId&remark=Order cancelled&type=2";
    await httpClient.post(endPoints.Auth().cancelOrder+param).then((responce){
      print(responce.toString());
      if(responce.statusCode==200){
        httpResponse.status=responce.statusCode;
        httpResponse.message=responce.data['message'];
        // httpResponse.data=PlaceOrderModel.fromJson(responce.data);

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


  Future<HttpResponse> productReview(String custId,String itemId,double value,String review) async{
    HttpResponse httpResponse=HttpResponse();
    // http://107.180.91.43:8080/ckwebapi/changeStatusByOrderId

    FormData formData = new FormData.fromMap({
      "ratingsId":0,
      "custId":custId,
      "itemId":itemId,
      "value":value,
      "insertDatetime":DateTime.now(),
      "exInt1":0,
      "exInt2":0,
      "exVar1":review,
      "exVar2":"",
      "exFloat1":0,
      "exFloat2":0
    });

    await httpClient.post(endPoints.Auth().productReview,body: formData).then((responce){
      print(responce.toString());
      if(responce.statusCode==200){
        httpResponse.status=responce.statusCode;
        httpResponse.message=responce.data['message'];
        // httpResponse.data=PlaceOrderModel.fromJson(responce.data);

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