class SaveAddress {
  int custAddressId,custId,areaId,cityId,delStatus,exInt1,exInt2,exInt3,langId;
  double exFloat1,exFloat2,exFloat3;
  String addressCaption,address,area,landmark,pincode,latitude,longitude,exVar1,exVar2,exVar3;


  @override
  String toString() {
    return 'custAddressId: $custAddressId, custId: $custId, areaId: $areaId, cityId: $cityId, delStatus: $delStatus, exInt1: $exInt1, exInt2: $exInt2, exInt3: $exInt3, exFloat1: $exFloat1, exFloat2: $exFloat2, exFloat3: $exFloat3, addressCaption: $addressCaption, address: $address, area: $area, landmark: $landmark, pincode: $pincode, latitude: $latitude, longitude: $longitude, exVar1: $exVar1, exVar2: $exVar2, exVar3: $exVar3';
  }

  SaveAddress(
      {this.custAddressId,
      this.custId,
        this.langId,
      this.addressCaption,
      this.address,
      this.areaId,
      this.area,
      this.landmark,
      this.pincode,
      this.cityId,
      this.delStatus,
      this.latitude,
      this.longitude,
      this.exInt1,
      this.exInt2,
      this.exInt3,
      this.exVar1,
      this.exVar2,
      this.exVar3,
      this.exFloat1,
      this.exFloat2,
      this.exFloat3});

}