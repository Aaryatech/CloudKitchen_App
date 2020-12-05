import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:json_annotation/json_annotation.dart';
part 'upload.g.dart';


@JsonSerializable(nullable: true)
class Uploads{

  final Info info;
  final String fileName;

  Uploads(this.info, this.fileName);


  factory Uploads.fromJson(Map<String, dynamic> json) => _$UploadsFromJson(json);
  Map<String, dynamic> toJson() => _$UploadsToJson(this);

}