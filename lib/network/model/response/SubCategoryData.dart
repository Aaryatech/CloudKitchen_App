
import 'package:json_annotation/json_annotation.dart';
part 'SubCategoryData.g.dart';

@JsonSerializable(nullable: false)
class SubCategoryData{
 int subCatId,catId; 
  String catName,subCatName;
  List<String> imageList;

  SubCategoryData(
      {this.subCatId,
      this.catId,
      this.catName,
      this.subCatName,
      this.imageList});

  factory SubCategoryData.fromJson(Map<String, dynamic> json) => _$SubCategoryDataFromJson(json);

  
  Map<String, dynamic> toJson() => _$SubCategoryDataToJson(this);
}