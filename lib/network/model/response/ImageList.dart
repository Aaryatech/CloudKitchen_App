import 'package:json_annotation/json_annotation.dart';
part 'ImageList.g.dart';

@JsonSerializable(nullable: false)
class ImageList{

  int imagesId,docType,docId,seqNo,isActive,delStatus,exInt1,exInt2,exInt3;
  String imageName,exVar1,exVar2,exVar3,exVar4,exFloat1,exFloat2,exFloat3;
 

  ImageList(
      {this.imagesId,
      this.docType,
      this.docId,
      this.imageName,
      this.seqNo,
      this.isActive,
      this.delStatus,
      this.exInt1,
      this.exInt2,
      this.exInt3,
      this.exVar1,
      this.exVar2,
      this.exVar3,
      this.exVar4,
      this.exFloat1,
      this.exFloat2,
      this.exFloat3});


    factory ImageList.fromJson(Map<String, dynamic> json) => _$ImageListFromJson(json);

  
  Map<String, dynamic> toJson() => _$ImageListToJson(this);
}