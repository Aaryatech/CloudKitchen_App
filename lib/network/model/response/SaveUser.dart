
import 'package:json_annotation/json_annotation.dart';
part 'SaveUser.g.dart';

@JsonSerializable(nullable: true)
class SaveUser{

   int custId,gender,langId,compId,cityId,frId,isBuissHead,isActive,delStatus,custAddPlatform,addedFormType,userId,isPremiumCust,exInt1,
   exInt2,exInt3,exInt4,exInt5;
  String custName,phoneNumber,whatsappNo,emailId,profilePic,custDob,ageGroup,companyName,gstNo,address,custAddDatetime,exVar1,
  exVar2,exVar3,exVar4,exVar5,message,langName;
  bool error;
  double exFloat1,exFloat2,exFloat3,exFloat4,exFloat5;

  SaveUser(
      {this.custId,
      this.custName,
      this.phoneNumber,
      this.whatsappNo,
      this.emailId,
      this.profilePic,
      this.gender,
      this.custDob,
      this.ageGroup,
      this.langId,
      this.compId,
      this.cityId,
      this.frId,
      this.isBuissHead,
      this.companyName,
      this.gstNo,
      this.address,
      this.isActive,
      this.delStatus,
      this.custAddPlatform,
      this.custAddDatetime,
      this.addedFormType,
      this.userId,
      this.isPremiumCust,
      this.exInt1,
      this.exInt2,
      this.exInt3,
      this.exInt4,
      this.exInt5,
      this.exVar1,
      this.exVar2,
      this.exVar3,
      this.exVar4,
      this.exVar5,
      this.exFloat1,
      this.exFloat2,
      this.exFloat3,
      this.exFloat4,
      this.exFloat5,
      this.error,
      this.message,
      this.langName});

      factory SaveUser.fromJson(Map<String, dynamic> json) => _$SaveUserFromJson(json);
   
     
     Map<String, dynamic> toJson() => _$SaveUserToJson(this);
}