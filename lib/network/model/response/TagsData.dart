
import 'package:json_annotation/json_annotation.dart';
part 'TagsData.g.dart';

@JsonSerializable(nullable: false)
class TagsData{
   int tagId,tagIsActive,tagDeleteStatus,tagSortNumber,exInt1,exInt2;
  String tagName,tagDesc,exVar1,exVar2;
 

  TagsData(
      {this.tagId,
      this.tagName,
      this.tagDesc,
      this.tagIsActive,
      this.tagDeleteStatus,
      this.tagSortNumber,
      this.exInt1,
      this.exInt2,
      this.exVar1,
      this.exVar2});

    factory TagsData.fromJson(Map<String, dynamic> json) => _$TagsDataFromJson(json);

  
  Map<String, dynamic> toJson() => _$TagsDataToJson(this);
}