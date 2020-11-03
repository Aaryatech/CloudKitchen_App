


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


  Future<bool> saveUserDetails(SaveAddress saveUserDetails) async {
    isLoading=true;


    saveUserDetails.custId=getCustId();
    HttpResponse httpResponse=  await customerAddressRepo.gsaveCustomerAddresss(saveUserDetails);
    if(httpResponse.status==200){

      if(!httpResponse.info.error)
      {

        myLocalPrefes.setCustLocationCapture(true);
        myLocalPrefes.setAddressId(httpResponse.message);
        myLocalPrefes.setUserLatitude(saveUserDetails.latitude);
        myLocalPrefes.setUserLongitude(saveUserDetails.longitude);

        return true;
      }else{
        msg=httpResponse.message;
        return false;
      }

    }else if(httpResponse.status==500) {
      return false;
    }
    isLoading=false;


  }

  @action
  int getCustId(){
    return myLocalPrefes.getCustId();

  }



}