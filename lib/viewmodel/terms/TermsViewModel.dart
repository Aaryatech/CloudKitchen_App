

import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/response/terms/termsmodel.dart';
import 'package:cloud_kitchen/network/repository/terms/termsrepo.dart';
import 'package:mobx/mobx.dart';

part 'TermsViewModel.g.dart';

class TermsViewModel = _TermsViewModel with _$TermsViewModel;


abstract class _TermsViewModel with Store {

  TermsRepo termsRepo;

  _TermsViewModel(){
    termsRepo=TermsRepo();
}

  @observable
  bool isLoading=true;


  @observable
  TermsModel termsModel;


  @action
  Future getTerms() async {
    isLoading = true;
    HttpResponse httpResponse = await termsRepo
        .getTermsOrAbout(true);

      if(httpResponse.status==200){

        termsModel = httpResponse.data;
        isLoading = false;

      }


  }


  @action
  Future getAbout() async {
    isLoading = true;
    HttpResponse httpResponse = await termsRepo
        .getTermsOrAbout(false);

      if(httpResponse.status==200){
        termsModel = httpResponse.data;
        isLoading = false;
      }else{
      }
  }

}

