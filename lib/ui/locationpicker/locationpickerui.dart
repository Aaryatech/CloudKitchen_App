import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location_permissions/location_permissions.dart';

class LocationPickerUI extends StatefulWidget {
  @override
  _LocationPickerUIState createState() => _LocationPickerUIState();
}

class _LocationPickerUIState extends State<LocationPickerUI> {

  LatLng currentPosition = LatLng(0, 0);
  Completer<GoogleMapController> _controller = Completer();

  Future<void> _onMapCreated(GoogleMapController controller) async {

    checkLocationPermisionStatus();
    mapcController=controller;
    // getCurrentLocation();
  }
  void animateCamera(GoogleMapController googleMapController) {
    LatLng latLng = LatLng(
        0.000000 ,
         0.000000 );
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: latLng, zoom: 60)));
  }



  PermissionStatus permissionStatus;

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
  final scaffoldState = GlobalKey<ScaffoldState>();


 void askForPermission()async{
     await LocationPermissions().requestPermissions();
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



   GoogleMapController mapcController;

  Future getCurrentLocation() async {
    // mapcController = await _controller.future;

   Geolocator.getCurrentPosition(     desiredAccuracy: LocationAccuracy.bestForNavigation,
     forceAndroidLocationManager: true,
   ).then((position) async{
          print(position == null ? 'Unknown' : position.latitude.toString() + ', ' + position.longitude.toString());

         animateCameraPosition(position);
   });
  }




  void animateCameraPosition(Position position){
    mapcController.animateCamera(
        CameraUpdate.newCameraPosition(CameraPosition(
            bearing: 192.8334901395799,
            target: LatLng(position.latitude, position.longitude),
            tilt: 59.440717697143555,
            zoom: 30.151926040649414)));


    getAdressbyLatLog(LatLng(position.latitude, position.longitude));
  }


 void getAdressbyLatLog( LatLng latLng)async{
   var addresses= await Geocoder.local.findAddressesFromCoordinates(Coordinates(latLng.latitude, latLng.longitude));
   var first = addresses.first;
   print("address -: ${first.featureName} : ${first.addressLine}");

   addMarker(latLng, first.addressLine);

  }





  final Map<String, Marker> _markers = {};

  BitmapDescriptor pinLocationIcon;
  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size:Size(100,150)),
        'images/place_pointer.png');
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
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: currentPosition,
                zoom: 1,
              ),
            ),


          ],
        ),
      ),

    );
  }
}
