
import 'package:cloud_kitchen/network/model/request/SaveAddress.dart';
import 'package:cloud_kitchen/ui/contactUs.dart';
import 'package:cloud_kitchen/ui/dashboard.dart';
import 'package:cloud_kitchen/ui/locationpicker/locationpickerui.dart';
import 'package:cloud_kitchen/ui/tackaway.dart';
import 'package:cloud_kitchen/viewmodel/location/locationviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_webservice/geocoding.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:location_permissions/location_permissions.dart';

AddLocationViewModel addLocationViewModel=AddLocationViewModel();
class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final scaffoldState = GlobalKey<ScaffoldState>();


  final places = new GoogleMapsPlaces(apiKey: "AIzaSyBahlnISPYhetj3q50ADqVE6SECypRGe4A");


String completeaddress='',floor='',howtoreach='',selected="HOME";

  void showImagePickerBottomSheet(BuildContext context){


    List<PlacesSearchResult> result=[];
    PlacesSearchResult selectedResult;

    showModalBottomSheet(
        context: context,
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
                color: Colors.white.withOpacity(0.5),
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

                   TextFormField(
                     enabled: true,
                     onChanged:(str) async{


                       PlacesSearchResponse response = await places.searchByText(str);

                       setState((){
                       selectedResult=null;
                       result=response.results;
                       });
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
                      child: Container(
                        height: MediaQuery.of(context).size.height*.70,
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
                            builder:(_)=> Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text('Selected address ${selectedResult.formattedAddress}',style: Theme.of(context).textTheme.subtitle2),

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

                                SizedBox(height: 16,),
                                Text('TAG THIS LOCATION FOR LATER',style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.grey),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FilterChip(
                                      shape: StadiumBorder(side: BorderSide(color: Colors.grey)),
                                      label: Text("HOME",style: Theme.of(context).textTheme.caption,),
                                      padding: EdgeInsets.only(left: 12,right: 12),
                                      labelStyle: TextStyle(letterSpacing: 2, color: Colors.black),

                                      selected: selected=="HOME",
                                      selectedColor: Colors.transparent,
                                      // backgroundColor: Theme.of(context).primaryColor,
                                      onSelected: (flag) {
                                        if(flag){
                                          setState(() {
                                            selected="HOME";
                                          });}
                                      },
                                    ),

                                    FilterChip(
                                      shape: StadiumBorder(side: BorderSide(color: Colors.grey)),
                                      label: Text("WORK",style: Theme.of(context).textTheme.caption),
                                      labelStyle: TextStyle(letterSpacing: 2, color: Colors.black),
                                      padding: EdgeInsets.only(left: 12,right: 12),
                                      selected: selected=="WORK",
                                      selectedColor: Colors.transparent,
                                      // backgroundColor: Theme.of(context).primaryColor,
                                      onSelected: (flag) {
                                        setState(() {
                                          if(flag)
                                          {
                                            selected="WORK";
                                          }
                                        });
                                      },
                                    ),

                                    FilterChip(
                                      // avatar: Icon(Icons.close,color: Colors.black),
                                      shape: StadiumBorder(side: BorderSide(color: Colors.grey)),
                                      label: Text("OTHER",style: Theme.of(context).textTheme.caption),
                                      labelStyle: TextStyle(letterSpacing: 2, color: Colors.black),
                                      padding: EdgeInsets.only(left: 12,right: 12),
                                      selected: selected=="OTHER",
                                      selectedColor: Colors.transparent,
                                      // backgroundColor: Theme.of(context).primaryColor,
                                      onSelected: (flag) {
                                        setState(() {
                                          selected="OTHER";
                                        });
                                      },
                                    ),
                                  ],
                                ),

                                Align(
                                  alignment: Alignment.center,
                                  child: RaisedButton(onPressed: (){

                                    if(!addLocationViewModel.isLoading){
                                    SaveAddress saveUserDetails=SaveAddress();

                                    saveUserDetails.custAddressId= 0;

                                    saveUserDetails.addressCaption= selected;
                                    saveUserDetails.address= "${completeaddress} - ${floor} - ${howtoreach}";
                                    saveUserDetails.areaId= 0;
                                    saveUserDetails.area= null;
                                    saveUserDetails.landmark= "${selectedResult.formattedAddress}";
                                    saveUserDetails.pincode= "";
                                    saveUserDetails.cityId= 1;
                                    saveUserDetails.langId=1;
                                    saveUserDetails.delStatus= 0;
                                    saveUserDetails.latitude= '${selectedResult.geometry.location.lat}';
                                    saveUserDetails.longitude= '${selectedResult.geometry.location.lng}';
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
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Dashboard())),
                                      }else{
                                        _showSnackbar(addLocationViewModel.msg, false),
                                      }
                                    }).catchError((onError){
                                    });
                                  }},
                                  child: Text('Save',style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.white),),
                                  color: Theme.of(context).primaryColor,
                                  ),
                                ),

                               addLocationViewModel.isLoading?LinearProgressIndicator():Container(),


                              ],
                            ),
                        ),
                          ),
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

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  void  _showSnackbar(String msg,bool isPositive) {
    scaffoldState.currentState.showSnackBar(
        SnackBar(
          content: Text(msg,style: TextStyle(color: Colors.white),),
          duration: Duration(seconds: 3),
          backgroundColor: isPositive?Colors.green:Colors.redAccent,
        ));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
           height: MediaQuery.of(context).size.height*0.30,
           // height: 400,
           // width: 300,
            ),

                        SizedBox(height: 20),


                        Text( 'Hi, nice to meet you!', style:Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.w700,color:Colors.black)),
                      SizedBox(
             height: 10,
                      ),
                      Text( 'Set your location to start exploring', style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                      Text( 'restaurants around you', style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),

                    SizedBox(
             height: 20,
                      ),


                   SizedBox(height: 20),

        Container(
   // height: 50.0,
    child: GestureDetector(
        onTap: () {
          // Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LocationPickerUI()));

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
                  borderRadius: BorderRadius.circular(2.0),

              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                      Icon(Icons.gps_fixed_outlined, color: Colors.white,),
                                             SizedBox(width: 8,),
                                             Text( "USE CURRENT LOCATION",
                           style:Theme.of(context).textTheme.button.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.white))
                  ],
              ),
        ),
    ),
),
SizedBox(height: 20),

 InkWell(
     onTap:(){ showImagePickerBottomSheet(context);},
     child: Text( 'SET YOUR LOCATION MANUALLY', style:Theme.of(context).textTheme.button.copyWith(fontWeight: FontWeight.bold).copyWith(color:Theme.of(context).primaryColor))),

 SizedBox(height: 40),
  Text( 'We only access your location while you are using the app to improve your experience',style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
  // Text( '', style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                      ],

                      ),
        ),
      ),
          ),
    );
  }
}