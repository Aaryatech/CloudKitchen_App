import 'package:json_annotation/json_annotation.dart';
part 'Language.g.dart';

@JsonSerializable(nullable: true)
class Language{

   int langId,companyId,delStatus,isActive,exInt1,exInt2;
  String langCode,langName,exVar1,exVar2;
  

  Language({this.langId,
      this.langCode,
      this.langName,
      this.companyId,
      this.delStatus,
      this.isActive,
      this.exInt1,
      this.exInt2,
      this.exVar1,
      this.exVar2});

         factory Language.fromJson(Map<String, dynamic> json) => _$LanguageFromJson(json);

  
  Map<String, dynamic> toJson() => _$LanguageToJson(this);
}