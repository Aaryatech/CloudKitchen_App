
import 'package:cloud_kitchen/network/model/response/ImageList.dart';
import 'package:cloud_kitchen/network/model/response/ItemData.dart';
import 'package:json_annotation/json_annotation.dart';
part 'SubCategoryData.g.dart';

@JsonSerializable(nullable: true)
class SubCategoryData{
 int subCatId,catId; 
  String catName,subCatName;
  List<ImageList> imageList;
  List<ItemData> itemList;

  SubCategoryData(
      {this.subCatId,
      this.catId,
      this.catName,
      this.subCatName,
      this.imageList,
      this.itemList});

  factory SubCategoryData.fromJson(Map<String, dynamic> json) => _$SubCategoryDataFromJson(json);

  
  Map<String, dynamic> toJson() => _$SubCategoryDataToJson(this);
}