
import 'package:json_annotation/json_annotation.dart';
part 'TasteList.g.dart';

@JsonSerializable(nullable: false)
class TasteList{

  int ingrediantId,ingrediantCatId,delStatus,isActive,exInt1,exInt2,exFloat1,exFloat2;
  String ingrediantName,ingrediantImage,exVar1,exVar2,lastOprationDatetime,ingrediantDesc;
  

    TasteList(
      {this.ingrediantId,
      this.ingrediantCatId,
      this.ingrediantName,
      this.delStatus,
      this.isActive,
      this.ingrediantImage,
      this.exInt1,
      this.exInt2,
      this.exVar1,
      this.exVar2,
      this.exFloat1,
      this.exFloat2,
      this.lastOprationDatetime,
      this.ingrediantDesc});

 factory TasteList.fromJson(Map<String, dynamic> json) => _$TasteListFromJson(json);

  
  Map<String, dynamic> toJson() => _$TasteListToJson(this);


}