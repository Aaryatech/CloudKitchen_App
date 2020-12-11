import 'dart:convert';

import 'package:cloud_kitchen/network/client/networkclient.dart';
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/response/GrievanceList.dart';
import 'package:cloud_kitchen/network/model/response/MadhviCredit.dart';
import 'package:cloud_kitchen/network/model/response/greviance/greviencetypemain.dart';
import 'package:dio/dio.dart';
import 'package:cloud_kitchen/network/base/endPoint.dart' as endPoints;


class GrievanceListRepo{

HttpClient httpClient;

GrievanceListRepo(){
  httpClient=HttpClient();
}

 
 Future<HttpResponse> getGreivance(String custId) async{
   HttpResponse httpResponse=HttpResponse();
   String params='?custId=$custId';
   await httpClient.post('${endPoints.Auth().grievanceList}$params').then((responce){
     if(responce.statusCode==200){
       httpResponse.status=responce.statusCode;
       httpResponse.message='Successful';
       httpResponse.info=Info.fromJson(responce.data['info']);

        if(!httpResponse.info.error){
          httpResponse.data = GrievanceListMain.fromJson(responce.data);
          print(httpResponse.data);
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


Future<HttpResponse> getGreivanceTypes() async{
  HttpResponse httpResponse=HttpResponse();

  List<GrievanceType> list=[];

  await httpClient.post('${endPoints.Auth().getGrievancetype}').then((responce){
    if(responce.statusCode==200){
      httpResponse.status=responce.statusCode;
      httpResponse.message='Successful';

      (responce.data as List).forEach((element) {
        list.add( GrievanceType.fromJson(element));
      });
      httpResponse.data=list;

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


Future<HttpResponse> addGreivance(int orderId,int typeId,String dateTime,int userId,int id) async{
  HttpResponse httpResponse=HttpResponse();

  await httpClient.post('${endPoints.Auth().addGrievancetype}',body: {
    "grieveId": 0,
    "orderId": orderId,
    "grievenceTypeId":typeId,
    "grievenceSubtypeId":id,
    "remark":"",
    "currentStatus":1,
    "insertDateTime":'${DateTime.now()}',
    "insertById":userId,
    "grievenceTypeName":"",
    "grievenceSubtypeName":"",
    "date":'${DateTime.now().toString().trim().split(' ')[0]}',
    "extraInt1":0,
    "extraInt2":0,
    "extraVar1":"",
    "extraVar2":"",
    "platform":0,
    "grievencceNo":"",
    "orderGrievanceTrail":{
      "trailId":0,
      "grievencesId":0,
      "remark":"",
      "status":0,
      "actionByUserId":0,
      "actionDateTime":"",
      "extraInt1":0,
      "extraInt2":0,
      "extraVar1":"",
      "extraVar2":0,
      "identifiedRootCause":0,
      "grievenceResType":0,
      "resolutionDetail":0,
      "repay_amt":0,
      "repayDetails":0
    }
  }).then((responce){

    print(responce);
    if(responce.statusCode==200){
      httpResponse.status=responce.statusCode;
      httpResponse.message='Successful';

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