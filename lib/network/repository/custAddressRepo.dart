import 'package:cloud_kitchen/local/prefs.dart';
import 'package:cloud_kitchen/network/client/networkclient.dart';

class AddressRepo{


  HttpClient httpClient;
  MyLocalPrefes myLocalPrefes;

  AddressRepo(){
    httpClient=HttpClient();
    myLocalPrefes=MyLocalPrefes();
  }






}