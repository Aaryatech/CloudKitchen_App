
import 'package:dio/dio.dart';
import '../base/base_url.dart' as BaseUrl;

class HttpClient{

Dio client;

HttpClient(){

 Map<String, dynamic> headers = {};
    headers['Content-Type'] = 'application/json';
   
  BaseOptions options = new BaseOptions(
    baseUrl: BaseUrl.baseUrl,
    connectTimeout: 15000,
    receiveTimeout: 15000,
    headers: headers,
);
 client=Dio(options);
}

Future<Response> get(String endpoint, {FormData body}) async {
    return client.request(endpoint,options: Options(method: "GET"));
  }

  Future<Response> post(String endpoint, { dynamic body }) async {
    return client.request(endpoint,data: body, options: Options(method: "POST"));
  } 

  Future<Response> put(String endpoint, { dynamic body }) async {
    return client.request(endpoint,data: body, options: Options(method: "PUT"));
  } 

  Future<Response> delete(String endpoint, { dynamic body }) async {
        return client.request(endpoint,data: body, options: Options(method: "DELETE"));
  }

}