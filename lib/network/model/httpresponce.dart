
import 'package:json_annotation/json_annotation.dart';
part 'httpresponce.g.dart';

class HttpResponse {
  int status = 400;
  String message = "";
  dynamic data;
  Info info;



  HttpResponse({ this.status, this.message, this.data,this.info});

}



@JsonSerializable(nullable: true)
class Info{
  String messege;
  bool error;

  Info(this.messege, this.error);

 factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);


 Map<String, dynamic> toJson() => _$InfoToJson(this);
}