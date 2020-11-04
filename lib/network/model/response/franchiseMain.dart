import 'package:cloud_kitchen/network/model/response/Franchise.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(nullable: true)
class FranchiseMain{

  List<Frainchise> franchiseList;

  FranchiseMain(this.franchiseList);

  static List<Frainchise> parseCourseList(
      Map<String, dynamic> json) {
    var list = json['franchise'] as List;
    if (list == null) {
      return List();
    }
    List<Frainchise> franchise =
    list.map((data) => Frainchise.fromJson(data)).toList();
    return franchise;
  }

  factory FranchiseMain.fromJson(Map<String, dynamic> json) {
    return FranchiseMain(parseCourseList(json));
  }



}