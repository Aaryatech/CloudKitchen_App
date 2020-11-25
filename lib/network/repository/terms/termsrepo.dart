

import 'package:cloud_kitchen/network/client/networkclient.dart';
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/base/endPoint.dart' as endPoints;
import 'package:cloud_kitchen/network/model/response/terms/termsmodel.dart';
import 'package:cloud_kitchen/ui/terms/terms.dart';


class TermsRepo{


  HttpClient httpClient;


  TermsRepo(){
    httpClient=HttpClient();
  }

  Future<HttpResponse> getTermsOrAbout(bool flag) async{
    HttpResponse httpResponse=HttpResponse();
String param='';
    if(flag){
      param='?key=TERMS_APP';
    }else{
      param='?key=ABOUT_US_APP';

    }

    await httpClient.post('${endPoints.Auth().getSettingsDataForApp}$param').then((responce){
      if(responce.statusCode==200){
        httpResponse.status=responce.statusCode;
        httpResponse.message='Successful';
          httpResponse.data=TermsModel.fromJson(responce.data['newSetting']);

      }else{
        httpResponse.status= 500;
        httpResponse.message='Something went wrong';
        httpResponse.data=null;


      }

    }).catchError((onError){
      httpResponse.status= 400;
      httpResponse.message='Network not available';
      httpResponse.data=onError.toString();


    });
    return httpResponse;

  }


}