import 'package:cloud_kitchen/network/model/response/ImageList.dart';

import 'package:json_annotation/json_annotation.dart';
part 'CategoryData.g.dart';

@JsonSerializable(nullable: true)
class CategoryData {
  int catId;
  String catName;
  List<ImageList> imageList;

  CategoryData({this.catId, this.catName, this.imageList});

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDataToJson(this);
}
