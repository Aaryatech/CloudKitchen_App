
import 'package:cloud_kitchen/network/model/request/SaveAddress.dart';
import 'package:cloud_kitchen/ui/home/dashboard.dart';
import 'package:cloud_kitchen/ui/locationpicker/locationpickerui.dart';
import 'package:cloud_kitchen/ui/tackaway.dart';
import 'package:cloud_kitchen/viewmodel/con/internet.dart';
import 'package:cloud_kitchen/viewmodel/location/locationviewmodel.dart';
import 'package:connectivity/connectivity.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:google_maps_webservice/geocoding.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:location_permissions/location_permissions.dart';
// import 'package:location/location.dart' as loc;
import 'package:mobx/mobx.dart';

AddLocationViewModel addLocationViewModel=AddLocationViewModel();
class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final scaffoldState = GlobalKey<ScaffoldState>();

  // loc.Location location = new loc.Location();
  final places = new GoogleMapsPlaces(apiKey: "AIzaSyBahlnISPYhetj3q50ADqVE6SECypRGe4A");


  String completeaddress='',floor='',howtoreach='',selected="Home",pincode='';

  void showImagePickerBottomSheet(BuildContext context){


    List<PlacesSearchResult> result=[];
    PlacesSearchResult selectedResult;


    showModalBottomSheet(
        context: context,
        backgroundColor:Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enableDrag: true,
        isScrollControlled: true,

        builder: (BuildContext bc){
          return StatefulBuilder(
              builder: (context, setState) {
                return SafeArea(
                  child: Container(

                    padding: EdgeInsets.only(left: 16,right: 16,bottom: 16,top: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Search Location",style: Theme.of(context).textTheme.headline6,),

                            IconButton(icon: Icon(Icons.close,), onPressed:(){
                              Navigator.pop(context);
                            })
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),

                        Container(
                          color: Colors.grey.withOpacity(0.5),
                          height: 1,
                          width: MediaQuery.of(context).size.width,
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          enabled: true,
                          autofillHints: [AutofillHints.addressCity],
                          enableSuggestions: true,
                          onChanged:(str) async{
                            PlacesSearchResponse response = await places.searchByText(str);
                            setState((){
                              selectedResult=null;
                              result=response.results;



                            });
                            print('${result[0].formattedAddress}');
                            print('${result[0].geometry.locationType}');
                            print('${result[0].geometry.location.toString()}');
                            print('${result[0].vicinity}');
                            print('${result[0].types[0]}');
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.search),

                            hintText: 'Search Your Place',
                            filled: true,
                            fillColor: Colors.white,

                            isDense: true,
                          ),
                        ),

                        SizedBox(height:
                        8,),

                        SingleChildScrollView(
                          child: Stack(
                            children: [
                              Container(
                                color:Colors.white,
                                height: MediaQuery.of(context).size.height*.56,
                                child: selectedResult==null?ListView.builder(
                                    itemCount: result.length,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        onTap: (){
                                          // Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);

                                          setState((){
                                            selectedResult=result[index];
                                          });

                                          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LocationPickerUI()));

                                        },
                                        leading: Icon(Icons.location_on_outlined),
                                        title: Text(result[index].name),
                                        subtitle: Text(result[index].formattedAddress),
                                      );
                                    }
                                ):Observer(
                                  builder:(_)=>  Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [

                                        Text('Selected address ${selectedResult
                                            .formattedAddress}', style: Theme
                                            .of(context)
                                            .textTheme
                                            .subtitle2),


                                        TextFormField(
                                          onChanged: (str) {
                                            setState((){
                                              completeaddress = str;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            hintText: 'Complete Address',
                                            errorText: completeaddress.isEmpty?'Please Enter Complete Address':null,
                                          ),
                                        ),

                                        TextFormField(
                                          onChanged: (str) {

                                            setState((){
                                              floor = str;
                                            });
                                          },

                                          decoration: InputDecoration(
                                            hintText: 'Floor',
                                            errorText: floor.isEmpty?'Please Enter Floor':null,
                                          ),
                                        ),

                                        TextFormField(
                                          onChanged: (str) {

                                            setState((){
                                              howtoreach = str;
                                            });
                                          },
                                          decoration: InputDecoration(


                                            hintText: 'How to reach',
                                            errorText: howtoreach.isEmpty?'Please Enter How to reach':null,
                                          ),
                                        ),


                                        TextFormField(
                                          onChanged: (str) {
                                            setState((){
                                              pincode = str;
                                            });

                                          },

                                          maxLengthEnforced: true,
                                          maxLength: 6,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            hintText: 'Pincode',
                                            errorText: pincode.isEmpty?'Please Enter Pincode':null,
                                          ),
                                        ),
                                        SizedBox(height: 16,),
                                        Text('TAG THIS LOCATION FOR LATER',
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .subtitle2
                                              .copyWith(color: Colors.grey),),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceEvenly,
                                          children: [
                                            FilterChip(
                                              shape: StadiumBorder(
                                                  side: BorderSide(
                                                      color: Colors.grey)),
                                              label: Text("Home", style: Theme
                                                  .of(context)
                                                  .textTheme
                                                  .caption,),
                                              padding: EdgeInsets.only(
                                                  left: 12, right: 12),
                                              labelStyle: TextStyle(
                                                  letterSpacing: 2,
                                                  color: Colors.black),

                                              selected: selected == "Home",
                                              selectedColor: Colors
                                                  .transparent,
                                              // backgroundColor: Theme.of(context).primaryColor,
                                              onSelected: (flag) {
                                                if (flag) {
                                                  setState(() {
                                                    selected = "Home";
                                                  });
                                                }
                                              },
                                            ),

                                            FilterChip(
                                              shape: StadiumBorder(
                                                  side: BorderSide(
                                                      color: Colors.grey)),
                                              label: Text("Work", style: Theme
                                                  .of(context)
                                                  .textTheme
                                                  .caption),
                                              labelStyle: TextStyle(
                                                  letterSpacing: 2,
                                                  color: Colors.black),
                                              padding: EdgeInsets.only(
                                                  left: 12, right: 12),
                                              selected: selected == "Work",
                                              selectedColor: Colors
                                                  .transparent,
                                              // backgroundColor: Theme.of(context).primaryColor,
                                              onSelected: (flag) {
                                                setState(() {
                                                  if (flag) {
                                                    selected = "Work";
                                                  }
                                                });
                                              },
                                            ),

                                            FilterChip(
                                              // avatar: Icon(Icons.close,color: Colors.black),
                                              shape: StadiumBorder(
                                                  side: BorderSide(
                                                      color: Colors.grey)),
                                              label: Text(
                                                  "Other", style: Theme
                                                  .of(context)
                                                  .textTheme
                                                  .caption),
                                              labelStyle: TextStyle(
                                                  letterSpacing: 2,
                                                  color: Colors.black),
                                              padding: EdgeInsets.only(
                                                  left: 12, right: 12),
                                              selected: selected == "Other",
                                              selectedColor: Colors
                                                  .transparent,
                                              // backgroundColor: Theme.of(context).primaryColor,
                                              onSelected: (flag) {
                                                setState(() {
                                                  selected = "Other";
                                                });
                                              },
                                            ),
                                          ],
                                        ),

                                        Align(
                                          alignment: Alignment.center,
                                          child: RaisedButton(onPressed: () {
                                            if (!addLocationViewModel
                                                .isLoading) {
                                              if (pincode.isNotEmpty && floor.isNotEmpty && howtoreach.isNotEmpty && completeaddress.isNotEmpty) {
                                                SaveAddress saveUserDetails = SaveAddress();

                                                saveUserDetails
                                                    .custAddressId =
                                                0;

                                                saveUserDetails
                                                    .addressCaption =
                                                    selected;
                                                saveUserDetails
                                                    .address =
                                                "${completeaddress} ~ ${floor} ~ ${howtoreach}";
                                                saveUserDetails
                                                    .areaId = 0;
                                                saveUserDetails.area =
                                                null;
                                                saveUserDetails
                                                    .landmark =
                                                "${selectedResult
                                                    .formattedAddress}";
                                                saveUserDetails
                                                    .pincode = "";
                                                saveUserDetails
                                                    .cityId = 1;
                                                saveUserDetails
                                                    .langId = 1;
                                                saveUserDetails
                                                    .delStatus = 0;
                                                saveUserDetails
                                                    .latitude =
                                                '${selectedResult.geometry
                                                    .location.lat}';
                                                saveUserDetails
                                                    .longitude =
                                                '${selectedResult.geometry
                                                    .location.lng}';
                                                saveUserDetails
                                                    .exInt1 = int.parse(pincode);
                                                saveUserDetails
                                                    .exInt2 = 0;
                                                saveUserDetails
                                                    .exInt3 = 0;
                                                saveUserDetails
                                                    .exVar1 = pincode;
                                                saveUserDetails
                                                    .exVar2 = "";
                                                saveUserDetails
                                                    .exVar3 = "";
                                                saveUserDetails
                                                    .exFloat1 = 0;
                                                saveUserDetails
                                                    .exFloat2 = 0;
                                                saveUserDetails
                                                    .exFloat3 = 0;

                                                FocusScope.of(context)
                                                    .unfocus();
                                                addLocationViewModel
                                                    .saveUserDetails(
                                                    saveUserDetails)
                                                    .then((value) =>
                                                {

                                                  print(
                                                      '#######$value######'),
                                                  if(value){
                                                    Navigator.pop(
                                                        context),
                                                    Navigator
                                                        .pushAndRemoveUntil(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (
                                                                context) =>
                                                                Dashboard()), (
                                                        r) => false),
                                                  } else
                                                    {
                                                      _showSnackbar(
                                                          addLocationViewModel
                                                              .msg,
                                                          false),
                                                    }
                                                }).catchError((
                                                    onError) {});
                                              }
                                            }
                                          },
                                            child: Text('Save', style: Theme
                                                .of(context)
                                                .textTheme
                                                .subtitle2
                                                .copyWith(
                                                color: Colors.white),),
                                            color: Theme
                                                .of(context)
                                                .primaryColor,
                                          ),
                                        ),

                                        addLocationViewModel.isLoading
                                            ? Center(
                                          child: CircularProgressIndicator(
                                            valueColor: AlwaysStoppedAnimation<
                                                Color>(Theme
                                                .of(context)
                                                .primaryColor),
                                          ),
                                        )
                                            : Container(),


                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              // addLocationViewModel.isLoading?Container(
                              //   width: MediaQuery.of(context).size.width,
                              //   height: MediaQuery.of(context).size.height,
                              //   color: Colors.black.withOpacity(.3),
                              //   child: Center(
                              //     child: CircularProgressIndicator(
                              //       valueColor:AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor) ,
                              //     ),
                              //   ),
                              // ):Container(),

                            ],
                          ),
                        ),





                      ],
                    ),
                  ),
                );
              }
          );
        }

    );




  }
  void searchByPlaces(String searchStr) async{

  }


  bool isNetWorkAvailable=true;
  ReactionDisposer _disposer;
  ConnectivityStore connectivityStore=ConnectivityStore();
  @override
  void initState() {
    // TODO: implement initState

    _disposer = reaction(
            (_) => connectivityStore.connectivityStream.value,
            (result) {
          if(result == ConnectivityResult.none){
            setState((){

              isNetWorkAvailable=false;

            });
          }else{
            setState((){
              isNetWorkAvailable=true;
            });
          }
        });
    super.initState();
  }

  bool _serviceEnabled=false;

  PermissionStatus permissionStatus;
  Future<PermissionStatus> checkLocationPermisionStatus()async{
    permissionStatus= await LocationPermissions().checkPermissionStatus();

    if(permissionStatus==PermissionStatus.denied){
      _showSnackbar('permission has been denied, Please set location manually or grant permission to proceed', false);

      askForPermission();

    }else if(permissionStatus==PermissionStatus.granted)
    {
      ServiceStatus serviceStatus=   await  checkifGpsActive();
      {
        _requestService();
        _showSnackbar('Please start GPS', false);

      }


    }else{
      _showSnackbar('We need location to serve you better please grant location from setting', false);

    }

  }

  Future<ServiceStatus> checkifGpsActive()async{
    return  await LocationPermissions().checkServiceStatus();
  }

  Future<void> _requestService() async {
    if (_serviceEnabled == null || !_serviceEnabled) {
      // final bool serviceRequestedResult = await location.requestService();
      // setState(() {
      //   _serviceEnabled = serviceRequestedResult;
      // });
      // if (!serviceRequestedResult) {
      //   return;
      // }else{
      //   // Navigator.push(context, MaterialPageRoute(builder: (context)=> LocationPickerUI()));
      // }
    }
  }

  void askForPermission()async {
    PermissionStatus status = await LocationPermissions().requestPermissions();

    // if(status==loc.PermissionStatus.denied || status==loc.PermissionStatus.denied){
    //
    // }else{
    //   checkifGpsActive().then((status) {
    //     if(status==ServiceStatus.enabled){
    //       // Navigator.push(context, MaterialPageRoute(builder: (context)=> LocationPickerUI()));
    //     }else{
    //       _requestService();
    //     }
    //
    //   });
  // }

    // }
    checkLocationPermisionStatus();
  }

  void  _showSnackbar(String msg,bool isPositive) {
    scaffoldState.currentState.showSnackBar(
        SnackBar(
          content: Text(msg,style: TextStyle(color: Colors.white),),
          duration: Duration(seconds: 3),
          backgroundColor: isPositive?Colors.green:Colors.redAccent,
        ));
  }


  void launchFlutterMap()async {


    PickResult results;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlacePicker(

          apiKey: 'AIzaSyBa6Uh5fdUu0AsPWoJcPrpxrvoLVMiaNw0',
          // Put YOUR OWN KEY here.
            selectedPlaceWidgetBuilder: (_, selectedPlace, state, isSearchBarFocused) {
              return isSearchBarFocused
                  ? Container() :FloatingCard(
                bottomPosition: 0.0,    // MediaQuery.of(context) will cause rebuild. See MediaQuery document for the information.
                leftPosition: 0.0,
                rightPosition: 0.0,
                width: 500,
                borderRadius: BorderRadius.circular(12.0),
                child: state == SearchingState.Searching ?
                Center(child: CircularProgressIndicator()) :
                // RaisedButton( child: Text('Pick'), onPressed: () { print("do something with [selectedPlace] data"); },),
                Container(
                  //  height: 50.0,
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(selectedPlace.formattedAddress,style: Theme.of(context).textTheme.bodyText2,),
                      ),
                      GestureDetector(
                        onTap: () {

                          print(selectedPlace.formattedAddress);
                          results=selectedPlace;
                          if (results != null) {
                            showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enableDrag: true,
                                isScrollControlled: true,

                                builder: (BuildContext bc) {
                                  return StatefulBuilder(
                                      builder: (context, setState) {
                                        return SafeArea(
                                          child: Container(

                                            padding: EdgeInsets.only(
                                                left: 16, right: 16, bottom: 16, top: 24),
                                            child: SingleChildScrollView(
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    color: Colors.white,
                                                    height: MediaQuery
                                                        .of(context)
                                                        .size
                                                        .height * .8,
                                                    child: Observer(
                                                      builder: (_) =>
                                                          Container(
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment
                                                                  .start,
                                                              children: [

                                                                Text('Selected address ${results
                                                                    .formattedAddress}', style: Theme
                                                                    .of(context)
                                                                    .textTheme
                                                                    .subtitle2),


                                                                TextFormField(
                                                                  onChanged: (str) {
                                                                    setState((){
                                                                      completeaddress = str;
                                                                    });
                                                                  },
                                                                  decoration: InputDecoration(
                                                                    hintText: 'Complete Address',
                                                                    errorText: completeaddress.isEmpty?'Please Enter Complete adreess':null,
                                                                  ),
                                                                ),

                                                                TextFormField(
                                                                  onChanged: (str) {

                                                                    setState((){
                                                                      floor = str;
                                                                    });
                                                                  },

                                                                  decoration: InputDecoration(
                                                                    hintText: 'Floor',
                                                                    errorText: floor.isEmpty?'Please Enter Floor':null,
                                                                  ),
                                                                ),

                                                                TextFormField(
                                                                  onChanged: (str) {

                                                                    setState((){
                                                                      howtoreach = str;
                                                                    });
                                                                  },
                                                                  decoration: InputDecoration(


                                                                    hintText: 'How to reach',
                                                                    errorText: howtoreach.isEmpty?'Please Enter How to reach':null,
                                                                  ),
                                                                ),


                                                                TextFormField(
                                                                  onChanged: (str) {
                                                                    setState((){
                                                                      pincode = str;
                                                                    });

                                                                  },

                                                                  maxLengthEnforced: true,
                                                                  maxLength: 6,
                                                                  keyboardType: TextInputType.number,
                                                                  decoration: InputDecoration(
                                                                    hintText: 'Pincode',
                                                                    errorText: pincode.isEmpty?'Please Enter Pincode':null,
                                                                  ),
                                                                ),
                                                                SizedBox(height: 16,),
                                                                Text('TAG THIS LOCATION FOR LATER',
                                                                  style: Theme
                                                                      .of(context)
                                                                      .textTheme
                                                                      .subtitle2
                                                                      .copyWith(color: Colors.grey),),
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment
                                                                      .spaceEvenly,
                                                                  children: [
                                                                    FilterChip(
                                                                      shape: StadiumBorder(
                                                                          side: BorderSide(
                                                                              color: Colors.grey)),
                                                                      label: Text("Home", style: Theme
                                                                          .of(context)
                                                                          .textTheme
                                                                          .caption,),
                                                                      padding: EdgeInsets.only(
                                                                          left: 12, right: 12),
                                                                      labelStyle: TextStyle(
                                                                          letterSpacing: 2,
                                                                          color: Colors.black),

                                                                      selected: selected == "Home",
                                                                      selectedColor: Colors
                                                                          .transparent,
                                                                      // backgroundColor: Theme.of(context).primaryColor,
                                                                      onSelected: (flag) {
                                                                        if (flag) {
                                                                          setState(() {
                                                                            selected = "Home";
                                                                          });
                                                                        }
                                                                      },
                                                                    ),

                                                                    FilterChip(
                                                                      shape: StadiumBorder(
                                                                          side: BorderSide(
                                                                              color: Colors.grey)),
                                                                      label: Text("Work", style: Theme
                                                                          .of(context)
                                                                          .textTheme
                                                                          .caption),
                                                                      labelStyle: TextStyle(
                                                                          letterSpacing: 2,
                                                                          color: Colors.black),
                                                                      padding: EdgeInsets.only(
                                                                          left: 12, right: 12),
                                                                      selected: selected == "Work",
                                                                      selectedColor: Colors
                                                                          .transparent,
                                                                      // backgroundColor: Theme.of(context).primaryColor,
                                                                      onSelected: (flag) {
                                                                        setState(() {
                                                                          if (flag) {
                                                                            selected = "Work";
                                                                          }
                                                                        });
                                                                      },
                                                                    ),

                                                                    FilterChip(
                                                                      // avatar: Icon(Icons.close,color: Colors.black),
                                                                      shape: StadiumBorder(
                                                                          side: BorderSide(
                                                                              color: Colors.grey)),
                                                                      label: Text(
                                                                          "Other", style: Theme
                                                                          .of(context)
                                                                          .textTheme
                                                                          .caption),
                                                                      labelStyle: TextStyle(
                                                                          letterSpacing: 2,
                                                                          color: Colors.black),
                                                                      padding: EdgeInsets.only(
                                                                          left: 12, right: 12),
                                                                      selected: selected == "Other",
                                                                      selectedColor: Colors
                                                                          .transparent,
                                                                      // backgroundColor: Theme.of(context).primaryColor,
                                                                      onSelected: (flag) {
                                                                        setState(() {
                                                                          selected = "Other";
                                                                        });
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),

                                                                Align(
                                                                  alignment: Alignment.center,
                                                                  child: RaisedButton(onPressed: () {
                                                                    if (!addLocationViewModel
                                                                        .isLoading) {
                                                                      if (pincode.isNotEmpty && floor.isNotEmpty && howtoreach.isNotEmpty && completeaddress.isNotEmpty) {
                                                                        SaveAddress saveUserDetails = SaveAddress();

                                                                        saveUserDetails
                                                                            .custAddressId =
                                                                        0;

                                                                        saveUserDetails
                                                                            .addressCaption =
                                                                            selected;
                                                                        saveUserDetails
                                                                            .address =
                                                                        "${completeaddress} ~ ${floor} ~ ${howtoreach}";
                                                                        saveUserDetails
                                                                            .areaId = 0;
                                                                        saveUserDetails.area =
                                                                        null;
                                                                        saveUserDetails
                                                                            .landmark =
                                                                        "${results
                                                                            .formattedAddress}";
                                                                        saveUserDetails
                                                                            .pincode = "";
                                                                        saveUserDetails
                                                                            .cityId = 1;
                                                                        saveUserDetails
                                                                            .langId = 1;
                                                                        saveUserDetails
                                                                            .delStatus = 0;
                                                                        saveUserDetails
                                                                            .latitude =
                                                                        '${results.geometry
                                                                            .location.lat}';
                                                                        saveUserDetails
                                                                            .longitude =
                                                                        '${results.geometry
                                                                            .location.lng}';
                                                                        saveUserDetails
                                                                            .exInt1 = int.parse(pincode);
                                                                        saveUserDetails
                                                                            .exInt2 = 0;
                                                                        saveUserDetails
                                                                            .exInt3 = 0;
                                                                        saveUserDetails
                                                                            .exVar1 = pincode??"";
                                                                        saveUserDetails
                                                                            .exVar2 = "";
                                                                        saveUserDetails
                                                                            .exVar3 = "";
                                                                        saveUserDetails
                                                                            .exFloat1 = 0;
                                                                        saveUserDetails
                                                                            .exFloat2 = 0;
                                                                        saveUserDetails
                                                                            .exFloat3 = 0;

                                                                        FocusScope.of(context)
                                                                            .unfocus();
                                                                        addLocationViewModel
                                                                            .saveUserDetails(
                                                                            saveUserDetails)
                                                                            .then((value) =>
                                                                        {

                                                                          print(
                                                                              '#######$value######'),
                                                                          if(value){
                                                                            Navigator.pop(
                                                                                context),
                                                                            Navigator
                                                                                .pushAndRemoveUntil(
                                                                                context,
                                                                                MaterialPageRoute(
                                                                                    builder: (
                                                                                        context) =>
                                                                                        Dashboard()), (
                                                                                r) => false),
                                                                          } else
                                                                            {
                                                                              _showSnackbar(
                                                                                  addLocationViewModel
                                                                                      .msg,
                                                                                  false),
                                                                            }
                                                                        }).catchError((
                                                                            onError) {});
                                                                      }
                                                                    }
                                                                  },
                                                                    child: Text('Save', style: Theme
                                                                        .of(context)
                                                                        .textTheme
                                                                        .subtitle2
                                                                        .copyWith(
                                                                        color: Colors.white),),
                                                                    color: Theme
                                                                        .of(context)
                                                                        .primaryColor,
                                                                  ),
                                                                ),

                                                                addLocationViewModel.isLoading
                                                                    ? Center(
                                                                  child: CircularProgressIndicator(
                                                                    valueColor: AlwaysStoppedAnimation<
                                                                        Color>(Theme
                                                                        .of(context)
                                                                        .primaryColor),
                                                                  ),
                                                                )
                                                                    : Container(),


                                                              ],
                                                            ),
                                                          ),
                                                    ),
                                                  ),


                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                });
                          }

                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).primaryColor,
                                style: BorderStyle.solid,
                                width: 1.0,
                              ),
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Center(
                                    child: Text("Verify & Continue",
                                        style: Theme.of(context)
                                            .textTheme
                                            .button
                                            .copyWith(
                                            fontWeight: FontWeight.normal)
                                            .copyWith(color: Colors.white)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              );},
          // onPlacePicked: (result) {
          //
          // },
          initialPosition:  LatLng(23.6163503,72.3496002),
          useCurrentLocation: true,
          usePlaceDetailSearch: true,
          selectInitialPosition: true,
          forceAndroidLocationManager: true,
          desiredLocationAccuracy: LocationAccuracy.bestForNavigation,
          resizeToAvoidBottomInset: true,
          usePinPointingSearch: true,
          hintText: 'Search location',
        ),
      ),
    );




  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        key: scaffoldState,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Image.asset(
                    "images/location.png",
                    height: MediaQuery.of(context).size.height*0.35,
                    // height: 400,
                    // width: 300,
                  ),

                  SizedBox(height: 20),


                  Text( 'Hi, nice to meet you!', style:Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.w600,color:Colors.black)),
                  SizedBox(
                    height: 10,
                  ),
                  Text( 'Set your location to start exploring', style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                  Text( 'restaurants around you', style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),


                  SizedBox(height: 20),

                  Container(
                    // height: 50.0,
                    child: InkWell(
                      onTap: () {

                        // FirebaseCrashlytics.instance.crash();
                        // Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);

                      if(isNetWorkAvailable) {
                        launchFlutterMap();
                      }else{
                        _showSnackbar('Please check internet connection', false);
                      }

                        // Navigator.push(context, MaterialPageRoute(builder: (context)=> MapUiPage()));

                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            style: BorderStyle.solid,
                            width: 1.0,
                          ),
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(8.0),

                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.gps_fixed_outlined, color: Colors.white,),
                            SizedBox(width: 8,),
                            Text( "Use Current Location",
                                style:Theme.of(context).textTheme.button.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.white))
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  InkWell(
                      onTap:(){

                        if(isNetWorkAvailable){
                        showImagePickerBottomSheet(context);
                        }else{
                        _showSnackbar('Please check internet connection', false);
                        }

                        },
                      child: Text( 'Set your location manually', style:Theme.of(context).textTheme.button.copyWith(fontWeight: FontWeight.bold).copyWith(color:Theme.of(context).primaryColor))),
                  SizedBox(height: 16),
                  Row(
                      children: <Widget>[
                        Expanded(
                            child: Divider(
                              color: Colors.grey,
                            )
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left:8.0,right: 8.0),
                          child: Text('OR', style: Theme
                              .of(context)
                              .textTheme
                              .caption),
                        ),

                        Expanded(
                            child: Divider(
                              color: Colors.grey,
                            )
                        ),
                      ]
                  ),

                  SizedBox(height: 24),
                  //
                  // InkWell(
                  //     onTap:(){ openAddressedBottomSheet();},
                  //     child: Text( 'Address history', style:Theme.of(context).textTheme.button.copyWith(fontWeight: FontWeight.bold).copyWith(color:Theme.of(context).primaryColor))),

                  Container(
                    // height: 50.0,
                    child: InkWell(
                      onTap: () {
if(isNetWorkAvailable){
                        openAddressedBottomSheet();
    }else{
    _showSnackbar('Please check internet connection', false);
    }

                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            style: BorderStyle.solid,
                            width: 1.0,
                          ),
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(8.0),

                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 28,width: 4,),
                            Expanded(
                              child: Text( "If your existing customer, Please select saved address",textAlign: TextAlign.center,
                                  style:Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.white)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 45),
                  Text( 'We only access your location while you are using the app to improve your experience',textAlign: TextAlign.center,style:Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.normal,).copyWith(color:Colors.grey.withOpacity(0.9))),
                  // Text( '', style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                ],

              ),
            ),
          ),
        ),
      ),
    );
  }

  void  openAddressedBottomSheet(){


    allFrenchisiViewModel.getAddress();
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enableDrag: true,
        builder: (BuildContext bc){
          return StatefulBuilder(
              builder: (context, setState) {

                return Container(

                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height*.5,
                  padding: EdgeInsets.fromLTRB(16,16,16,1),


                  child: Observer(
                    builder:(_)=>

                        Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Saved Addresses",style: Theme.of(context).textTheme.headline6,),

                                      IconButton(icon: Icon(Icons.close,), onPressed:(){
                                        Navigator.pop(context);
                                      })
                                    ],
                                  ),

                                  SizedBox(
                                    height: 4,
                                  ),

                                  allFrenchisiViewModel.isAddressLoading?Container( height: 2, child: LinearProgressIndicator(
                                    valueColor:AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor) ,

                                  )):

                                  SizedBox(
                                    height: MediaQuery.of(context).size.height*.3924,
                                    child: ListView.separated(
                                        itemCount:  allFrenchisiViewModel.adressesMain.addressList.length,
                                        separatorBuilder: (context, index) => Divider(
                                          color: Colors.black54,
                                          height: 1,
                                        ),
                                        itemBuilder: (context, index) {
                                          return ListTile(

                                            onTap: (){


                                              allFrenchisiViewModel.changeDefAddress(allFrenchisiViewModel.adressesMain.addressList[index]);

                                              Navigator.pushAndRemoveUntil(context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Dashboard()),(r) => false);
                                            },

                                            title: Text(allFrenchisiViewModel
                                                .adressesMain
                                                .addressList[index]
                                                .addressCaption,style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.w500),softWrap: true,overflow: TextOverflow.fade,),

                                            subtitle: Text(allFrenchisiViewModel
                                                .adressesMain
                                                .addressList[index]
                                                .landmark,style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.grey)),

                                            leading: getLogo(allFrenchisiViewModel
                                                .adressesMain
                                                .addressList[index].addressCaption),
                                          );
                                        }

                                    ),
                                  ),

                                ],



                              ),

                            ]
                        ),
                  ),
                );
              }
          );
        }

    );

  }


  Widget getLogo(String caption){
    switch(caption.toLowerCase()){
      case 'home':{
        return Icon(Icons.home,color: Theme.of(context).primaryColor,);
      }
      break;


      case 'work':{
        return Icon(Icons.work,color: Theme.of(context).primaryColor);
      }
      break;


      case 'other':{
        return Icon(Icons.assistant_navigation,color: Theme.of(context).primaryColor);
      }
      break;


    }


  }
}