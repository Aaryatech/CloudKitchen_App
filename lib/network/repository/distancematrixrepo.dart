


import 'package:cloud_kitchen/network/client/networkclient.dart';
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/response/distancematrics/distancematricsone.dart';
import 'package:dio/dio.dart';

class DistancematrixRepo{

        HttpClient httpClient;

        DistancematrixRepo(){
            httpClient=HttpClient();
        }


        Future<HttpResponse> DistanceMatrixApi(String origin,String destination) async {
          HttpResponse httpResponse=HttpResponse();

          print('${origin}, ${destination}');
        try {
            Response response = await Dio().get("https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins=$origin&destinations=$destination&key=AIzaSyBahlnISPYhetj3q50ADqVE6SECypRGe4A");
            print(response);

            if(response.statusCode==200){
              httpResponse.status=200;
              httpResponse.message=response.statusMessage;
              httpResponse.data=DistanceMatrix.fromJson(response.data);

        }else{
              httpResponse.status=400;
              httpResponse.message='Something went wrong,Please try again!';
            }

        } catch (e) {
          httpResponse.status=500;
          httpResponse.message='Something went wrong,Please try again!';
        }

        return httpResponse;
        }


}