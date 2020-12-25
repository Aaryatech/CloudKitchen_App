import 'package:cloud_kitchen/local/prefs.dart';
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/request/bulkorder.dart';
import 'package:cloud_kitchen/network/model/request/dairymart/dairymart.dart';
import 'package:cloud_kitchen/network/model/response/DeliveryInstruction.dart';
import 'package:cloud_kitchen/network/repository/bulkorder.dart';
import 'package:cloud_kitchen/network/repository/deliveryinstructionRepo.dart';
import 'package:cloud_kitchen/ui/dairymart/dairymart.dart';
import 'package:mobx/mobx.dart';

part 'bulkorderviewmodel.g.dart';

class BulkOrderViewModel =_BulkOrderViewModel with _$BulkOrderViewModel;


abstract class _BulkOrderViewModel with Store{

  BulkOrderRepo bulkOrderRepo;


  _BulkOrderViewModel(){
    bulkOrderRepo=BulkOrderRepo();
  }


  // @observable
  // DeliveryInstructionMain deliveryInstructionMain;


  @observable
  bool isLoading=true;


  @observable
  DairyMartModel mart;


  @observable
  int selected=0;

  @observable
  String selectedReson='';

  @observable
  BulkOrderModel bulkOrderModel;



  @action
  Future getMartStatus() async {
    isLoading = true;
    HttpResponse httpResponse = await bulkOrderRepo.checkDairyStatus();
    print(httpResponse.data.toString());
    if (httpResponse.status == 200) {
      print(httpResponse.data);
      if (!httpResponse.info.error) {
        mart=httpResponse.data;
        isLoading = false;
      }
    } else if (httpResponse.status == 500) {
      isLoading = false;
    }
  }




  @action
  Future placeBulkOrder(BulkOrderModel bulkOrderModel) async {
    isLoading = true;
    HttpResponse httpResponse = await bulkOrderRepo.placeBulkOrder(bulkOrderModel);
    print(httpResponse.data.toString());
    if (httpResponse.status == 200) {
      if (!httpResponse.info.error) {
        isLoading = false;
      }
    } else if (httpResponse.status == 500) {
      isLoading = false;
    }
  }

}
