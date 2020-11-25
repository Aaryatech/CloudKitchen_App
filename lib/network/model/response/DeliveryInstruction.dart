import 'package:json_annotation/json_annotation.dart';
part 'DeliveryInstruction.g.dart';



@JsonSerializable(nullable: true)
class DeliveryInstructionMain{
 final List<DeliveryInstruction> deliveryInstruction;

   DeliveryInstructionMain(this.deliveryInstruction);

  factory DeliveryInstructionMain.fromJson(Map<String, dynamic> json) => _$DeliveryInstructionMainFromJson(json);


  Map<String, dynamic> toJson() => _$DeliveryInstructionMainToJson(this);
}



@JsonSerializable(nullable: true)
class DeliveryInstruction{
   int instruId,delStatus,isActive,companyId,exInt1,exInt2;
  String description,instructnCaption,exVar1,exVar2;
  

  DeliveryInstruction({this.instruId,
      this.description,
      this.instructnCaption,
      this.delStatus,
      this.isActive,
      this.companyId,
      this.exInt1,
      this.exInt2,
      this.exVar1,
      this.exVar2});

  factory DeliveryInstruction.fromJson(Map<String, dynamic> json) => _$DeliveryInstructionFromJson(json);

  
  Map<String, dynamic> toJson() => _$DeliveryInstructionToJson(this);
}