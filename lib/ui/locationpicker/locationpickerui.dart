import 'dart:async';

import 'package:cloud_kitchen/network/model/request/SaveAddress.dart';
import 'package:cloud_kitchen/ui/home/dashboard.dart';
import 'package:cloud_kitchen/viewmodel/location/locationviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:location/location.dart' as loc;


AddLocationViewModel addLocationViewModel=AddLocationViewModel();
class LocationPickerUI extends StatefulWidget {
  @override
  _LocationPickerUIState createState() => _LocationPickerUIState();
}

class _LocationPickerUIState extends State<LocationPickerUI> {

 loc.Location location = new loc.Location();
  LatLng currentPosition = LatLng(23.6163503,72.3496002);


  Completer<GoogleMapController> _controller = Completer();


  void animateCamera(GoogleMapController googleMapController) {
    LatLng latLng = LatLng(45.521563, -122.677433);
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: latLng, zoom: 45)));
  }



  PermissionStatus permissionStatus;
  String completeaddress='',floor='',howtoreach='';

 bool _serviceEnabled;
 Future<void> _requestService() async {
   if (_serviceEnabled == null || !_serviceEnabled) {
     final bool serviceRequestedResult = await location.requestService();
     setState(() {
       _serviceEnabled = serviceRequestedResult;
     });
     if (!serviceRequestedResult) {
       return;
     }else{
       getCurrentLocation();
     }
   }
 }
  Future<PermissionStatus> checkLocationPermisionStatus()async{
    permissionStatus= await LocationPermissions().checkPermissionStatus();

    if(permissionStatus==PermissionStatus.denied){
      _showSnackbar('permission has been denied, Please set location manually or grant permission to proceed', false);

      askForPermission();

    }else if(permissionStatus==PermissionStatus.granted)
    {
      ServiceStatus serviceStatus=   await  checkifGpsActive();


      if(serviceStatus==ServiceStatus.enabled){
        getCurrentLocation();
      }else{
        _requestService();
        _showSnackbar('Please start gps', false);

      }


    }else{
      _showSnackbar('We need location to serve you better please grant location from setting', false);

    }

  }
  @override
  void initState() {
    // TODO: implement initState
    setCustomMapPin();
    super.initState();
  }

  String btnText='Continue';
  bool showUi=false;
  final scaffoldState = GlobalKey<ScaffoldState>();


 void askForPermission()async{
    PermissionStatus status= await LocationPermissions().requestPermissions();

    if(status==loc.PermissionStatus.denied){
      Navigator.pop(context);
    }else if(status==loc.PermissionStatus.granted){
      getCurrentLocation();
    }

    checkLocationPermisionStatus();
 }


  Future<ServiceStatus> checkifGpsActive()async{
    return  await LocationPermissions().checkServiceStatus();
  }

  void  _showSnackbar(String msg,bool isPositive) {
    scaffoldState.currentState.showSnackBar(
        SnackBar(
          content: Text(msg,style: TextStyle(color: Colors.white),),
          duration: Duration(seconds: 3),
          backgroundColor: isPositive?Colors.green:Colors.redAccent,
        ));
  }



  bool isAddressAvailable=false;

  bool isCuurentLocation=false;

  Future getCurrentLocation() async {
    // mapcController = await _controller.future;

    setState(() {
      isCuurentLocation=true;
    });
   Geolocator.getCurrentPosition(     desiredAccuracy: LocationAccuracy.high,
   ).then((position) async{
          print(position == null ? 'Unknown' : position.latitude.toString() + ', ' + position.longitude.toString());


         animateCameraPosition(position);
          setState(() {
            isCuurentLocation=false;
          });


   });
  }

String selected='Home';


  void animateCameraPosition(Position position){


    // _controller.animateCamera(
    //     CameraUpdate.newCameraPosition(CameraPosition(
    //         bearing: 192.8334901395799,
    //         target: LatLng(position.latitude, position.longitude),
    //         tilt: 50.440717697143555,
    //         zoom: 20.151926040649414)));


    getAdressbyLatLog(LatLng(position.latitude, position.longitude));
  }

  var addresses;
 void getAdressbyLatLog( LatLng latLng)async{
   currentPosition=  LatLng(latLng.latitude, latLng.longitude);
  addresses= await Geocoder.local.findAddressesFromCoordinates(Coordinates(latLng.latitude, latLng.longitude));
   var first = addresses.first;
   print("address -: ${first.featureName} : ${first.addressLine}");
   addMarker(latLng, first.addressLine);
   setState(() {
     isAddressAvailable=true;
   });



  }



  final Map<String, Marker> _markers = {};

  BitmapDescriptor pinLocationIcon;
  void setCustomMapPin() async {
    // pinLocationIcon = await BitmapDescriptor.fromAssetImage(
    //     ImageConfiguration(size:Size(100,150)),
    //     'images/place_pointer.png');
  }


  void addMarker(LatLng latlng, String info) {
    final marker = Marker(
        markerId: MarkerId(latlng.longitude.toString()),
        position: latlng,
        icon: pinLocationIcon,
        onDragEnd: ((latlong) {
          print(latlong.toString());
          setState(() {
            _markers.clear();
            animateCameraPosition(Position(latitude: latlng.latitude,longitude: latlng.longitude));

          });
        }),
        draggable: true,
        visible: true);

    setState(() {
      _markers[latlng.longitude.toString()] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldState,
        body: Stack(
          children: [
            GoogleMap(
              zoomControlsEnabled: true,
              zoomGesturesEnabled: true,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              compassEnabled: true,
            mapType: MapType.normal,
            markers:  _markers.values.toSet(),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              initialCameraPosition: CameraPosition(
                target: currentPosition,
                zoom: 1,
              ),
            ),



            isCuurentLocation?Positioned(
            top: 40,
            child: Container(
              height: 3,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(16),
              child: LinearProgressIndicator(
                valueColor:AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor) ,
              ),
            ),):Container(),

            isAddressAvailable?Positioned(
              top: 40,
              child: Container(
                margin: EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width-40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                ),
                child: Card(
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Row(
                        //   children: [
                        //     Icon(Icons.location_on_outlined),
                        //     Text('Your location : ${addresses.first.addressLine.toString()}',style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.white),),
                        //   ],
                        // ),

                        ListTile(
                          title: Text('Your food will be delivered here',style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white) ,),
                          subtitle: Text('Drag marker to change location',style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white) ),
                          enabled: true,
                          selected: true,
                          dense: true,
                          leading: Image.asset('images/place_icon.png',width: 24,height: 24,color: Colors.white,),
                          contentPadding: EdgeInsets.all(1),

                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ):Container(),


            Positioned(
              bottom: 1,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                color: Colors.transparent,

                width: MediaQuery
                    .of(context)
                    .size
                    .width,

                child: Observer(
                  builder:(_)=> Card(

                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Select Delivery Location",style: Theme.of(context).textTheme.headline6,),
                          SizedBox(
                            height: 8,
                          ),

                          Container(
                            height: 1,
                            color: Colors.grey.withOpacity(0.5),
                            width: MediaQuery.of(context).size.width,
                          ),

                          SizedBox(
                            height: 8,
                          ),
                          Container(

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Your Location',style: Theme.of(context).textTheme.subtitle2,),
                                SizedBox(height: 4,),
                                Row(
                                  children: [
                                    Icon(Icons.check_circle,color: Theme.of(context).primaryColor,),
                                    SizedBox(width: 4,),
                                    Text(isAddressAvailable?'${addresses.first.addressLine}':"",style: Theme.of(context).textTheme.subtitle2,softWrap: true,),

                                  ],
                                ),

                                SizedBox(
                                  height: 8,
                                ),

                                Container(
                                  height: 1,
                                  color: Colors.grey.withOpacity(0.5),
                                  width: MediaQuery.of(context).size.width,
                                ),


                                showUi?Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextFormField(
                                        onChanged: (str) {
                                          completeaddress=str;
                                        },
                                        decoration: InputDecoration(
                                          hintText: 'Complete Address *',
                                        ),
                                      ),

                                      TextFormField(
                                        onChanged: (str) {
                                          floor=str;
                                        },

                                        decoration: InputDecoration(
                                          hintText: 'Floor(Optional)',
                                        ),
                                      ),

                                      TextFormField(
                                        onChanged: (str) {
                                          howtoreach=str;
                                          },
                                          decoration: InputDecoration(


                                          hintText: 'How to reach(Optional)',
                                          ),
                                          ),
                                          SizedBox(height: 8,),

                                          Text('TAG THIS LOCATION FOR LATER',style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.grey),),
                                          Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                          FilterChip(
                                          shape: StadiumBorder(side: BorderSide(color: Colors.grey)),
                                          label: Text("Home",style: Theme.of(context).textTheme.caption,),
                                          padding: EdgeInsets.only(left: 12,right: 12),
                                            labelStyle: TextStyle(letterSpacing: 2, color: Colors.black),

                                            selected: selected=="Home",
                                            selectedColor: Colors.transparent,
                                            // backgroundColor: Theme.of(context).primaryColor,
                                            onSelected: (flag) {
                                              if(flag){
                                              setState(() {
                                                selected="Home";
                                              });}
                                            },
                                          ),

                                          FilterChip(
                                            shape: StadiumBorder(side: BorderSide(color: Colors.grey)),
                                            label: Text("Work",style: Theme.of(context).textTheme.caption),
                                            labelStyle: TextStyle(letterSpacing: 2, color: Colors.black),
                                            padding: EdgeInsets.only(left: 12,right: 12),
                                            selected: selected=="Work",
                                            selectedColor: Colors.transparent,
                                            // backgroundColor: Theme.of(context).primaryColor,
                                            onSelected: (flag) {
                                              setState(() {
                                                if(flag)
                                                {
                                                  selected="Work";
                                                }
                                              });
                                            },
                                          ),

                                          FilterChip(
                                            // avatar: Icon(Icons.close,color: Colors.black),
                                            shape: StadiumBorder(side: BorderSide(color: Colors.grey)),
                                            label: Text("Other",style: Theme.of(context).textTheme.caption),
                                            labelStyle: TextStyle(letterSpacing: 2, color: Colors.black),
                                            padding: EdgeInsets.only(left: 12,right: 12),
                                            selected: selected=="Other",
                                            selectedColor: Colors.transparent,
                                            // backgroundColor: Theme.of(context).primaryColor,
                                            onSelected: (flag) {
                                              setState(() {
                                                selected="Other";
                                              });
                                            },
                                          ),
                                        ],
                                      )

                                    ],
                                  ),
                                ):Container(),

                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  //  height: 50.0,
                                  child: GestureDetector(
                                    onTap: () {
                                      if(btnText!='Continue') {
                                       SaveAddress saveUserDetails=SaveAddress();

                                       saveUserDetails.custAddressId= 0;

                                      saveUserDetails.addressCaption= selected;
                                      saveUserDetails.address= "${completeaddress} - ${floor} - ${howtoreach}";
                                      saveUserDetails.areaId= 0;
                                      saveUserDetails.area= null;
                                       saveUserDetails.landmark= "${addresses.first.addressLine}";
                                       saveUserDetails.pincode= "121212";
                                       saveUserDetails.cityId= 1;
                                       saveUserDetails.langId=1;
                                       saveUserDetails.delStatus= 0;
                                       saveUserDetails.latitude= '${currentPosition.latitude}';
                                       saveUserDetails.longitude= '${currentPosition.longitude}';
                                       saveUserDetails.exInt1= 0;
                                       saveUserDetails.exInt2= 0;
                                       saveUserDetails.exInt3= 0;
                                       saveUserDetails.exVar1= "";
                                       saveUserDetails.exVar2= "";
                                       saveUserDetails.exVar3="";
                                       saveUserDetails.exFloat1=0;
                                       saveUserDetails.exFloat2= 0;
                                       saveUserDetails.exFloat3= 0;




                                      addLocationViewModel.saveUserDetails(saveUserDetails).then((value) => {

                                        if(value){
                                          Navigator.pushAndRemoveUntil(context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Dashboard()),(r) => false),
                                        }else{
                                          _showSnackbar(addLocationViewModel.msg, false),
                                        }

                                      }).catchError((onError){

                                      });

                                      }else{

                                        setState(() {
                                          showUi=true;
                                          btnText="Save";
                                        });


                                      }

                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(context).primaryColor,
                                          style: BorderStyle.solid,
                                          width: 1.0,
                                        ),
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.circular(2.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Center(
                                              child: Row(
                                                children: [
                                                  Icon(Icons.gps_fixed_outlined, color: Colors.white,),

                                                  SizedBox(width: 8,),
                                                  Text(
                                                      btnText,
                                                      style:Theme.of(context).textTheme.button.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.white)),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                addLocationViewModel.isLoading?Container(
                                  height: 4,
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.all(16),
                                  child: LinearProgressIndicator(
                                    valueColor:AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor) ,
                                  ),
                                ):Container(),

                              ],
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // addLocationViewModel.isLoading?Center(
            //   child: CircularProgressIndicator(
            //     valueColor:AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor) ,
            //   ),
            // ):Container(),


          ],
        ),
      ),

    );
   }
 }

