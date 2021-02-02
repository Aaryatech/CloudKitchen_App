import 'package:cloud_kitchen/network/client/networkclient.dart';
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/response/City.dart';
import 'package:cloud_kitchen/network/base/endPoint.dart' as endPoints;

class CityRepo {
  HttpClient httpClient;

  CityRepo() {
    httpClient = HttpClient();
  }

  Future<HttpResponse> getCity() async {
    HttpResponse httpResponse = HttpResponse();

    await httpClient.get(endPoints.Auth().allCity).then((responce) {
      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.data = City.fromJson(responce.data);
      } else {
        httpResponse.status = 500;
        httpResponse.message = 'Something went wrong';
        httpResponse.data = null;
      }
    }).catchError((onError) {
      httpResponse.status = 400;
      httpResponse.message = 'Network not available';
      httpResponse.data = onError.toString();
    });

    return httpResponse;
  }
}
