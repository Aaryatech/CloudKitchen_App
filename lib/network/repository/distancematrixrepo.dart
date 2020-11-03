


import 'package:cloud_kitchen/network/client/networkclient.dart';
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:dio/dio.dart';

class DistancematrixRepo{

        HttpClient httpClient;

        DistancematrixRepo(){
            httpClient=HttpClient();
        }


        Future<HttpResponse> DistanceMatrix(String origin,String destination) async {

          print('${origin}, ${destination}');
        try {
            Response response = await Dio().get("https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins=$origin&destinations=$destination&key=AIzaSyBahlnISPYhetj3q50ADqVE6SECypRGe4A");
            print(response);

            if(response.statusCode==200){

        }

        } catch (e) {
              print(e);
              }
        }


}