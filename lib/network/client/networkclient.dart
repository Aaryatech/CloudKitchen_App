
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import '../base/base_url.dart' as BaseUrl;

class HttpClient{

Dio client;

String basicAuthenticationHeader(String username, String password) {
  return 'Basic ' + base64Encode(utf8.encode('$username:$password'));
}

HttpClient(){

 Map<String, dynamic> headers = {};
    headers['Content-Type'] = 'application/json';
    headers['authorization']= basicAuthenticationHeader('aaryatech', 'Aaryatech@1cr');
    BaseOptions options = new BaseOptions(
    baseUrl: BaseUrl.baseUrl,
    connectTimeout: 60000,
    receiveTimeout: 60000,
    headers: headers,
);
 client=Dio(options);
 client.interceptors.add(DioCacheManager(CacheConfig(baseUrl: BaseUrl.baseUrl)).interceptor);

}

Future<Response> get(String endpoint, {FormData body}) async {

    print("$endpoint    ${body.toString()} ");
    return client.request(endpoint,options: Options(method: "GET", ));
  }

  Future<Response> post(String endpoint, { dynamic body }) async {
    print("$endpoint    ${body.toString()} ");

    return client.request(endpoint,data: body, options: Options(method: "POST", ));
  } 

  Future<Response> put(String endpoint, { dynamic body }) async {
    print("$endpoint    ${body.toString()} ");

    return client.request(endpoint,data: body, options: Options(method: "PUT"));
  } 

  Future<Response> delete(String endpoint, { dynamic body }) async {
    print("$endpoint    ${body.toString()} ");
        return client.request(endpoint,data: body, options: Options(method: "DELETE"));
  }

}