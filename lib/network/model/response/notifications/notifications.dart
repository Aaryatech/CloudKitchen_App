import 'package:json_annotation/json_annotation.dart';
part 'notifications.g.dart';

@JsonSerializable(nullable: true)
class Notifications{
final int notificationId,delStatus,exInt1,exInt2,type;
final  String title,description,datetime,image,exVar1,exVar2;

  Notifications(this.notificationId, this.delStatus, this.exInt1, this.exInt2, this.type, this.title, this.description, this.datetime, this.image, this.exVar1, this.exVar2);


factory Notifications.fromJson(Map<String, dynamic> json) => _$NotificationsFromJson(json);
Map<String, dynamic> toJson() => _$NotificationsToJson(this);

}