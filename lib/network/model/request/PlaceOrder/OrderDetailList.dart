class OrderDetailList{
  int orderDetailId,orderId,itemId,qty,cgstPer,sgstPer,igstPer,discAmt,delStatus,exInt1,exInt2,exInt3,exInt4,exFloat2,exFloat3,exFloat4;
  double mrp,rate,taxableAmt,cgstAmt,sgstAmt,igstAmt,taxAmt,totalAmt,exFloat1;
  String remark;
 

  OrderDetailList(
      {this.orderDetailId,
      this.orderId,
      this.itemId,
      this.qty,
      this.mrp,
      this.rate,
      this.taxableAmt,
      this.cgstPer,
      this.sgstPer,
      this.igstPer,
      this.cgstAmt,
      this.sgstAmt,
      this.igstAmt,
      this.discAmt,
      this.taxAmt,
      this.totalAmt,
      this.delStatus,
      this.remark,
      this.exInt1,
      this.exInt2,
      this.exInt3,
      this.exInt4,
      this.exFloat1,
      this.exFloat2,
      this.exFloat3,
      this.exFloat4});
}