import '../../httpresponce.dart';
import 'package:json_annotation/json_annotation.dart';

import 'notifications.dart';
part 'notificationsmain.g.dart';
@JsonSerializable(nullable: true)
class NotificationMain{
  final  Info info;

  final List<Notifications> notification;

  NotificationMain(this.info,this.notification);
  factory NotificationMain.fromJson(Map<String, dynamic> json) => _$NotificationMainFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationMainToJson(this);
}
