import 'package:cloud_kitchen/local/prefs.dart';
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/response/DeliveryInstruction.dart';
import 'package:cloud_kitchen/network/repository/deliveryinstructionRepo.dart';
import 'package:mobx/mobx.dart';

part 'deliveryinstructionviewmodel.g.dart';

class DIViewModel = _DIViewModel with _$DIViewModel;

abstract class _DIViewModel with Store {
  DeliveryInstructionRepo deliveryInstructionRepo;
  MyLocalPrefes myLocalPrefes;

  _DIViewModel() {
    myLocalPrefes = MyLocalPrefes();
    deliveryInstructionRepo = DeliveryInstructionRepo();
  }

  @observable
  DeliveryInstructionMain deliveryInstructionMain;

  @observable
  bool isLoading = true;

  @observable
  int selected = 0;

  @observable
  String selectedReson = '';

  @action
  Future<int> getCusId() async {
    return await myLocalPrefes.getCustId();
  }

  @action
  setSelectedvalue(int selectedvalue) {
    selected = selectedvalue;
  }

  Future getInstruction() async {
    isLoading = true;

    HttpResponse httpResponse =
        await deliveryInstructionRepo.deliveryinstruction();

    print(httpResponse.data.toString());

    if (httpResponse.status == 200) {
      if (!httpResponse.info.error) {
        deliveryInstructionMain = httpResponse.data;

        if (selectedReson == '') {
          selectedReson =
              deliveryInstructionMain.deliveryInstruction[0].instructnCaption;
        }
      }
    } else if (httpResponse.status == 500) {}
    isLoading = false;
  }
}
