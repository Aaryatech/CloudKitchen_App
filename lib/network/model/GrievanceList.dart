import 'package:cloud_kitchen/network/model/Grievance.dart';
import 'package:json_annotation/json_annotation.dart';
part 'GrievanceList.g.dart';

@JsonSerializable(nullable: true)
class GrievanceList{

List<Grievance> grievanceList;
	 

     GrievanceList({
      this.grievanceList,
      });

   factory GrievanceList.fromJson(Map<String, dynamic> json) => _$GrievanceListFromJson(json);

  
  Map<String, dynamic> toJson() => _$GrievanceListToJson(this);

}