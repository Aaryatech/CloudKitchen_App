import 'package:cloud_kitchen/network/client/networkclient.dart';
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/request/bulkorder.dart';
import 'package:cloud_kitchen/network/model/request/dairymart/dairymart.dart';
import 'package:cloud_kitchen/network/base/endPoint.dart' as endPoints;

class BulkOrderRepo {
  HttpClient httpClient;

  BulkOrderRepo() {
    httpClient = HttpClient();
  }

  Future<HttpResponse> placeBulkOrder(BulkOrderModel order) async {
    HttpResponse httpResponse = HttpResponse();

    String params =
        '?name=${order.name}&number=${order.number}&email=${order.email}&time=${order.time}&people=${order.people}&address=${order.address}';

    await httpClient
        .post('${endPoints.Auth().bulkOrder}$params')
        .then((responce) {
      print(responce);
      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.info = Info.fromJson(responce.data);
      } else {
        httpResponse.status = 500;
        httpResponse.message = 'Something went wrong';
        httpResponse.data = null;
      }
    }).catchError((onError) {
      print(onError);
      httpResponse.status = 404;
      httpResponse.data = null;
      httpResponse.message = 'Network not available';
    });
    return httpResponse;
  }

  Future<HttpResponse> checkDairyStatus() async {
    HttpResponse httpResponse = HttpResponse();

    await httpClient.post(endPoints.Auth().settingsForApp).then((responce) {
      print(responce);
      if (responce.statusCode == 200) {
        httpResponse.status = responce.statusCode;
        httpResponse.message = 'Successful';
        httpResponse.info = Info.fromJson(responce.data['info']);
        httpResponse.data =
            DairyMartModel.fromJson(responce.data['newSetting']);
      } else {
        httpResponse.status = 500;
        httpResponse.message = 'Something went wrong';
        httpResponse.data = null;
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
