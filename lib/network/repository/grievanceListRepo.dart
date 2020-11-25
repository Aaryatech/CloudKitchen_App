import 'package:cloud_kitchen/network/client/networkclient.dart';
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/response/GrievanceList.dart';
import 'package:cloud_kitchen/network/model/response/MadhviCredit.dart';
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

}