
import 'package:cloud_kitchen/network/model/response/CategoryData.dart';
import 'package:cloud_kitchen/network/model/response/Info.dart';
import 'package:cloud_kitchen/network/model/response/ItemData.dart';
import 'package:cloud_kitchen/network/model/response/OfferData.dart';
import 'package:cloud_kitchen/network/model/response/SubCategoryData.dart';
import 'package:json_annotation/json_annotation.dart';

import 'TagsData.dart';
part 'FranchiseId.g.dart';

@JsonSerializable(nullable: false)
class FranchiseId{
@JsonSerializable(nullable: false)  
Info info;
  List<CategoryData> categoryData;
  List<SubCategoryData> subCategoryData;
  List<OfferData> offerData;
  List<TagsData> tagsData;
  List<ItemData> itemData;

    FranchiseId(
      {this.info,
      this.categoryData,
      this.subCategoryData,
      this.offerData,
      this.tagsData,
      this.itemData});

  factory FranchiseId.fromJson(Map<String, dynamic> json) => _$FranchiseIdFromJson(json);

  
  Map<String, dynamic> toJson() => _$FranchiseIdToJson(this);

}