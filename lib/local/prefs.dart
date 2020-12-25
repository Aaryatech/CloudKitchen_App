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
  String defFranchiseDairy='DefFrinchiseDairy';
  String defFranchiseName='defFranchiseName';
  String defFranchiseAddrress='defFranchiseAddrress';
  String isLocationCapture="isLocationCature";
  String custDetails="PersonalDetailsAvailable";
  String isFrSelect='IsFranchiseSelected';
  String selectedAddress='SelectedAddress';
  String selectedAddressCaption='SelectedAddressCaption';
  String selectedOutletType="OutletType";
  String delType="DelType";
  String profUrl="ProfUrl";
  String gstNo="gstNo";


  String getProUrl(){
    return prefs.getString(profUrl)??"";
  }


  Future setProfUrl(String  url) async{
    await prefs.setString(profUrl,url);
  }


  String getGSTNo(){
    return prefs.getString(gstNo)??"";
  }


  Future setGSTNo(String  url) async{
    await prefs.setString(gstNo,url);
  }

  int getDefType(){
    return prefs.getInt(delType)??2;
  }

  Future setDefType(int  type) async{
    await prefs.setInt(delType,type);
  }


  String getdefFranchiseAddrress(){
    return prefs.getString(defFranchiseAddrress)??"";
  }

  Future setdefFranchiseAddrress(String  address) async{
    await prefs.setString(defFranchiseAddrress,address);
  }

  String getdefFranchiseName(){
    return prefs.getString(defFranchiseName)??"";
  }

  Future setdefFranchiseName(String  name) async{
    await prefs.setString(defFranchiseName,name);
  }



  int getSelectedOutletType(){
    return prefs.getInt(selectedOutletType)??1;
  }

  Future setSelectedOutletType(int outlet) async{
    await prefs.setInt(selectedOutletType,outlet);
  }



  String getSelectedAddress(){
    return prefs.getString(selectedAddress)??"";
  }

  Future setSelectedAddress(String address) async{
    await prefs.setString(selectedAddress,address);
  }

  String getSelectedAddressCaption(){
    return prefs.getString(selectedAddressCaption)??"";
  }

  Future setSelectedAddressCaption(String address) async{
    await prefs.setString(selectedAddressCaption,address);
  }



  bool isFrSelected(){
    return  prefs.getBool(isFrSelect)??false;
  }

  Future setFrSelected(bool flag)async{
    return await prefs.setBool(isFrSelect, flag);
  }




  int getDefFranchiseRest(){
     return prefs.getInt(   defFranchise)??0;
  }

  Future setDefFranchiseRest(int frId) async{
    await prefs.setInt(defFranchise,frId);
  }

  int getdefFranchiseDairy(){
     return prefs.getInt(defFranchiseDairy)??0;
  }

  Future setdefFranchiseDairy(int frId) async{
    await prefs.setInt(defFranchiseDairy,frId);
  }

  int getAddressId(){
    return prefs.getInt(addressId);
  }

  Future setAddressId(int address) async{
    await prefs.setInt(addressId,address);
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
    return prefs.getString(custPhone)??"";
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