import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLocalPrefes{
  SharedPreferences prefs ;

  MyLocalPrefes() {
    init();
  }
    Future init() async {
    prefs= await SharedPreferences.getInstance();
  }

  String userLatitude="usersLatitude";
  String userLongitude="usersLongitude";
  String custId="CustId";
  String custPhone="PhoneNumber";
  String custname="CustName";
  String isLogin="isLoggedIn";
  String addressId="AddressId";
  String defFranchise='DefFrinchise';

  String isLocationCapture="isLocationCature";

  String custDetails="PersonalDetailsAvailable";

  String isFrSelect='IsFranchiseSelected';


  bool isFrSelected(){
    return  prefs.getBool(isFrSelect)??false;
  }

  Future setFrSelected(bool flag)async{
    return await prefs.setBool(isFrSelect, flag);
  }




  String getDefFranchise(){
     return prefs.getString(defFranchise)??"";
  }

  Future setDefFranchise(String frId) async{
    await prefs.setString(defFranchise,frId);
  }

  String getAddressId(){
    return prefs.getString(custDetails);
  }

  Future setAddressId(String address) async{
    await prefs.setString(addressId,address);
  }


  String getUserLatitude(){
    return prefs.getString(userLatitude);
  }

  Future setUserLatitude(String lat) async{
    await prefs.setString(userLatitude,lat);
  }


  String getUserLongitude(){
    return prefs.getString(userLongitude);
  }

  Future setUserLongitude(String lon) async{
    await prefs.setString(userLongitude,lon);
  }

  bool getCustLogin(){
    return  prefs.getBool(isLogin)??false;
  }

  Future setCustLogin(bool flag)async{
    return await prefs.setBool(isLogin, flag);
  }

  bool getCustLocationCapture(){
    return  prefs.getBool(isLocationCapture)??false;
  }

  Future setCustLocationCapture(bool flag)async{
    return await prefs.setBool(isLocationCapture, flag);
  }


  int getCustId(){
  return  prefs.getInt(custId)??0;
  }

  Future setCustId(int id)async{
   return await prefs.setInt(custId, id);
  }


  bool getCustDeatils(){
    return prefs.getBool(custDetails)??false;
  }

  Future setCustDetails(bool deatils)async {
    return await prefs.setBool(custDetails, deatils);
  }


  String getCustPhone(){
    return prefs.getString(custPhone);
  }

  Future setCustPhone(String phone)async {
    return await prefs.setString(custPhone, phone);
  }

    String getCustName(){
      return prefs.getString(custname);
    }

    Future setCustName(String name)async{
      return await prefs.setString(custname, name);
    }

}