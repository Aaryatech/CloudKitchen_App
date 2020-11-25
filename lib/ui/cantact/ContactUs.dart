
import 'package:json_annotation/json_annotation.dart';
part 'ContactUs.g.dart';

@JsonSerializable(nullable: true)
class ContactUs{

   String message="";
   bool error;

  ContactUs(
      {
      this.error,
      this.message,
      });

      factory ContactUs.fromJson(Map<String, dynamic> json) => _$ContactUsFromJson(json);
   
     
     Map<String, dynamic> toJson() => _$ContactUsToJson(this);
}