
import 'package:json_annotation/json_annotation.dart';
part 'Images.g.dart';

@JsonSerializable(nullable: false)
class Images{
   int imagesId,docType,docId,isActive,delStatus,exInt1,exInt2,exInt3;
	 String imageName,seqNo,exVar1,exVar2,exVar3,exVar4,exFloat1,exFloat2,exFloat3;
	 

   Images({this.imagesId,this.docType,this.docId,this.imageName,this.seqNo,this.isActive,this.delStatus,this.exInt1,this.exInt2,this.exInt3,this.exVar1,this.exVar2,this.exVar3,this.exVar4,this.exFloat1,this.exFloat2,this.exFloat3});

    factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  
  Map<String, dynamic> toJson() => _$ImagesToJson(this);


}