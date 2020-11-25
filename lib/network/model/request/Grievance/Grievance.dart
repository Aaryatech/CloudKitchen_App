
import 'package:cloud_kitchen/network/model/request/Grievance/OrderGrievanceTrail.dart';

class Grievance{
  int grieveId,orderId,grievenceTypeId,grievenceSubtypeId,currentStatus,insertById,extraInt1,extraInt2,platform;
  String remark,insertDateTime,grievenceTypeName,grievenceSubtypeName,date,extraVar1,extraVar2,grievencceNo,grvInstrustion,grvType,orderNo;
  OrderGrievanceTrail orderGrievanceTrail;

  Grievance(
      {this.grieveId,
      this.orderId,
      this.grievenceTypeId,
      this.grievenceSubtypeId,
      this.remark,
      this.currentStatus,
      this.insertDateTime,
      this.insertById,
      this.grievenceTypeName,
      this.grievenceSubtypeName,
      this.date,
      this.extraInt1,
      this.extraInt2,
        this.grievencceNo,
        this.grvInstrustion,
        this.grvType,
        this.orderNo,
        this.orderGrievanceTrail,
      this.extraVar1,
      this.extraVar2,
      this.platform,
     });
}