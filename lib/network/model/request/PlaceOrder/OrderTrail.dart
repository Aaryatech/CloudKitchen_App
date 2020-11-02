class OrderTrail{
   int trailId,orderId,actionByUserId,status,exInt1,exInt2,exInt3;
  String actionDateTime,exVar1;
 

  OrderTrail(
      {this.trailId,
      this.orderId,
      this.actionByUserId,
      this.actionDateTime,
      this.status,
      this.exInt1,
      this.exInt2,
      this.exInt3,
      this.exVar1});
}