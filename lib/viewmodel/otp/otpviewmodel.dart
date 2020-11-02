


import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/response/MobileVerificationModel.dart';
import 'package:cloud_kitchen/network/repository/mobileverificationrepo.dart';
import 'package:mobx/mobx.dart';
part 'otpviewmodel.g.dart';

class OtpViewModel =_OtpViewModel with _$OtpViewModel;


abstract class _OtpViewModel with Store {

   MobileVerificationRepo mobileVerificationRepo;

   _OtpViewModel(){

    mobileVerificationRepo=MobileVerificationRepo();
  }


   @observable
   bool isLoading=false;


   @observable
   bool isSuccess=false;





   @action
   Future<bool> mobileVerification(String mobile,String otp) async {
     isLoading = true;
     HttpResponse httpResponse = HttpResponse();
     await mobileVerificationRepo
         .mobileVerification(mobile,otp)
         .then((value) {
       isLoading = false;
       if(value){
         isSuccess=true;

       }else{
         isSuccess=false;
       }

       return isSuccess;
     }).catchError((onError) {
       isLoading = false;
       isSuccess=false;
     });
     return isSuccess;
   }




}