


import 'package:cloud_kitchen/local/prefs.dart';
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/request/SaveAddress.dart';
import 'package:cloud_kitchen/network/repository/customerAddressRepo.dart';
import 'package:mobx/mobx.dart';
part 'locationviewmodel.g.dart';

class AddLocationViewModel =_AddLocationViewModel with _$AddLocationViewModel;


abstract class _AddLocationViewModel with Store {
  CustomerAddressRepo customerAddressRepo;
  MyLocalPrefes myLocalPrefes;


  @observable
  bool isLoading=false;


  @observable
  String msg='';

  _AddLocationViewModel(){
    myLocalPrefes=MyLocalPrefes();
    customerAddressRepo=CustomerAddressRepo();
  }


  @action
  Future<bool> saveUserDetails(SaveAddress saveUserDetails) async {
    isLoading=true;

    saveUserDetails.custId=myLocalPrefes.getCustId();
    HttpResponse httpResponse=  await customerAddressRepo.gsaveCustomerAddresss(saveUserDetails);
    if(httpResponse.status==200){
        isLoading=false;

      try {
        await  myLocalPrefes.setSelectedAddress(saveUserDetails.landmark);
        await myLocalPrefes.setCustLocationCapture(true);
        await myLocalPrefes.setSelectedAddressCaption(saveUserDetails.addressCaption);
        // await myLocalPrefes.setAddressId(saveUserDetails.custAddressId);
        await myLocalPrefes.setUserLatitude(saveUserDetails.latitude);
        await myLocalPrefes.setUserLongitude(saveUserDetails.longitude);
        await myLocalPrefes.setdefFranchiseDairy(0);
        await myLocalPrefes.setDefFranchiseRest(0);
        await myLocalPrefes.setAddressId(int.parse(httpResponse.message));
        return true;

      }catch(onError){
        isLoading=false;
        return true;
      }

    }else if(httpResponse.status==500) {
      isLoading=false;
      return false;
    }

  }

  @action
  int getCustId(){
    return myLocalPrefes.getCustId();

  }



}