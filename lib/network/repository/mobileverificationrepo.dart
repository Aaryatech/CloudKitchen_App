import 'package:cloud_kitchen/network/client/networkclient.dart';
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/response/MobileVerificationModel.dart';
import 'package:dio/dio.dart';
import 'package:cloud_kitchen/network/base/endPoint.dart' as endPoints;


class MobileVerificationRepo{
  HttpClient httpClient;

MobileVerificationRepo(){
  httpClient=HttpClient();
}


  Future<bool> mobileVerification(String mobile,String otp) async {
    try {
      Response response = await Dio().get("https://smsapi.24x7sms.com/api_2.0/SendSMS.aspx?APIKEY=pJMAaVPuGbh&MobileNo=$mobile&SenderID=MDVDRY&Message=<%23> $otp is your Madhvi verification code. Enjoy :-) tkbCPx5vSMz&ServiceName=TEMPLATE_BASED");
      print(response);

      if(response.statusCode==200){
        return true;
      }

    } catch (e) {
      print(e);
      return false;
    }
}

}
