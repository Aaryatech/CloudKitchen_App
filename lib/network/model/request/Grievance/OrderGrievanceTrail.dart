class OrderGrievanceTrail{
   int trailId,grievencesId,status,actionByUserId,extraInt1,extraInt2,extraVar2,identifiedRootCause,grievenceResType,resolutionDetail,repayAmt,repayDetails;
  String remark,actionDateTime,extraVar1;
  

  OrderGrievanceTrail(
      {this.trailId,
      this.grievencesId,
      this.remark,
      this.status,
      this.actionByUserId,
      this.actionDateTime,
      this.extraInt1,
      this.extraInt2,
      this.extraVar1,
      this.extraVar2,
      this.identifiedRootCause,
      this.grievenceResType,
      this.resolutionDetail,
      this.repayAmt,
      this.repayDetails});
}