import 'package:cloud_kitchen/network/model/request/SaveAddress.dart';
import 'package:cloud_kitchen/network/model/response/CustomerAddress.dart';
import 'package:cloud_kitchen/ui/home/HomeScreen.dart';
import 'package:cloud_kitchen/ui/model/AddressBookModel.dart';
import 'package:cloud_kitchen/viewmodel/franchisi/frviewmodel.dart';
import 'package:cloud_kitchen/viewmodel/location/locationviewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';


AddLocationViewModel addLocationViewModel=AddLocationViewModel();
class AddressBook extends StatefulWidget {
  AllFrenchisiViewModel allFrenchisiViewModel;
  AddressBook(this.allFrenchisiViewModel);
  @override
  _AddressBookState createState() => _AddressBookState();
}

class _AddressBookState extends State<AddressBook> {



  @override
  void initState() {
    // TODO: implement initState
    widget.allFrenchisiViewModel.getAddress();
    super.initState();
  }

  final List<AddressBookModel> address = [
    AddressBookModel(heading: 'HOME',desc: 'NCC Seventh Avenue,Model Colony Road,Pritum Nagar,Model Colony Town,Ludhiana Punjab 141002,India',icon: Icons.home),
    AddressBookModel(heading: 'OFFICE/WORK',desc: 'NCC Seventh Avenue,Model Colony Road,Pritum Nagar,Model Colony Town,Ludhiana Punjab 141002,India',icon: Icons.local_post_office),
    AddressBookModel(heading: 'OTHER',desc: 'NCC Seventh Avenue,Model Colony Road,Pritum Nagar,Model Colony Town,Ludhiana Punjab 141002,India',icon: Icons.send)

  ];


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

 final colpeteadrres=TextEditingController();
 final floor=TextEditingController();
 final howtoreach=TextEditingController();

  void showImagePickerBottomSheet(BuildContext context,CustomerAddress addressMain){

    print(addressMain.address);
    colpeteadrres.text=addressMain.address.trim().split('~')[0]??"";
    floor.text=addressMain.address.trim().split('~')[1]??"";
    howtoreach.text=addressMain.address.trim().split('~')[2]??"";



    bool isLoading =false;

    showModalBottomSheet(
        context: context,
        backgroundColor:Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),


        builder: (BuildContext bc){
          return StatefulBuilder(
              builder: (context, setState) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height*7,
                  child: SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height*7,

                      padding: EdgeInsets.only(left: 16,right: 16,bottom: 16,top: 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Edit Address",style: Theme.of(context).textTheme.headline6,),

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

                          Text('TAG THIS LOCATION FOR LATER',style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.grey),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FilterChip(
                                shape: StadiumBorder(side: BorderSide(color: Colors.grey)),
                                label: Text("HOME",style: Theme.of(context).textTheme.caption,),
                                padding: EdgeInsets.only(left: 12,right: 12),
                                labelStyle: TextStyle(letterSpacing: 2, color: Colors.black),

                                selected: addressMain.addressCaption.toLowerCase()=="home",
                                selectedColor: Colors.transparent,
                                // backgroundColor: Theme.of(context).primaryColor,
                                onSelected: (flag) {
                                  if(flag){
                                    setState(() {
                            addressMain.addressCaption="HOME";
                                    });}
                                },
                              ),

                              FilterChip(
                                shape: StadiumBorder(side: BorderSide(color: Colors.grey)),
                                label: Text("WORK",style: Theme.of(context).textTheme.caption),
                                labelStyle: TextStyle(letterSpacing: 2, color: Colors.black),
                                padding: EdgeInsets.only(left: 12,right: 12),
                                selected: addressMain.addressCaption.toLowerCase()=="work",
                                selectedColor: Colors.transparent,
                                // backgroundColor: Theme.of(context).primaryColor,
                                onSelected: (flag) {
                                  setState(() {
                                    if(flag)
                                    {
                                      addressMain.addressCaption="WORK";
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
                                selected:  addressMain.addressCaption=="OTHER",
                                selectedColor: Colors.transparent,
                                // backgroundColor: Theme.of(context).primaryColor,
                                onSelected: (flag) {
                                  setState(() {
                                    addressMain.addressCaption="OTHER";
                                  });
                                },
                              ),
                            ],
                          ),

                          SizedBox(height:
                          8,),


                          Text(
                            'landmark -${addressMain.landmark}'
                          ),

                          SizedBox(height:
                          8,),

                          TextFormField(
                            controller:colpeteadrres,
                            enabled: true,
                            onChanged:(str) async{

                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),

                              labelText: 'Complete Address',
                              hintText: 'complete Address',
                              filled: true,
                              fillColor: Colors.white,

                              isDense: true,
                            ),
                          ),

                          SizedBox(height:
                          8,),

                          TextFormField(
                            enabled: true,
                            controller: floor,
                            onChanged:(str) async{
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Floor',
                              hintText: 'Floor',
                              filled: true,
                              fillColor: Colors.white,

                              isDense: true,
                            ),
                          ),

                          SizedBox(height:
                          8,),


                          TextFormField(
                            enabled: true,
                            controller: howtoreach,
                            onChanged:(str) async{

                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'How To Reach',
                              labelText: 'How To Reach',
                              filled: true,
                              fillColor: Colors.white,

                              isDense: true,
                            ),
                          ),

                          SizedBox(height:
                          8,),

                          InkWell(

                            onTap: (){

                              setState((){
                                isLoading=true;
                              });


                  if(!addLocationViewModel.isLoading){
                  SaveAddress saveUserDetails=SaveAddress();

                  saveUserDetails.custAddressId= addressMain.custAddressId;

                  saveUserDetails.addressCaption= addressMain.addressCaption;
                  saveUserDetails.custId= addressMain.custId;
                  saveUserDetails.address= "${colpeteadrres.text} ~ ${floor.text} ~ ${howtoreach.text}";
                  saveUserDetails.areaId= 0;
                  saveUserDetails.area= null;
                  saveUserDetails.landmark= "${addressMain.landmark}";
                  saveUserDetails.pincode= "";
                  saveUserDetails.cityId= 1;
                  saveUserDetails.langId=1;
                  saveUserDetails.delStatus= 0;
                  saveUserDetails.latitude= '${addressMain.latitude}';
                  saveUserDetails.longitude= '${addressMain.longitude}';
                  saveUserDetails.exInt1= 0;
                  saveUserDetails.exInt2= 0;
                  saveUserDetails.exInt3= 0;
                  saveUserDetails.exVar1= "";
                  saveUserDetails.exVar2= "";
                  saveUserDetails.exVar3="";
                  saveUserDetails.exFloat1=0;
                  saveUserDetails.exFloat2= 0;
                  saveUserDetails.exFloat3= 0;

                  FocusScope.of(context).unfocus();
                  addLocationViewModel.saveUserDetails(saveUserDetails).then((value) => {
                  print(value),

                  widget.allFrenchisiViewModel.getAddress(),
                  Navigator.pop(context),

                  }).catchError((onError){

                  });
                  }},

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
                                    child: Text( "Save",textAlign: TextAlign.center,
                                        style:Theme.of(context).textTheme.button.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.white)),
                                  )
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 8,),
                          isLoading?Container(
                            child: Center(
                              child: LinearProgressIndicator(
                                valueColor:AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor) ,
                              ),
                            ),
                          ):Container(),

                        ],
                      ),
                    ),
                  ),
                );
              }
          );
        }

    );




  }


  Future<void> _showMyDialog(int id) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Address'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Would you like to permanently delete this address?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                widget.allFrenchisiViewModel.deleteAddressId(id).then((value) =>
                widget.allFrenchisiViewModel.getAddress(),
                );
                Navigator.of(context).pop();
              },
            ),

            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Observer(
        builder:(_)=> Scaffold(
          appBar: AppBar(
            title: Text('Address Book',style: Theme.of(context).textTheme.headline6.copyWith(color:Colors.white),),
          ),
          body:

        widget.allFrenchisiViewModel.isAddressLoading?LinearProgressIndicator(): ListView.separated(
          separatorBuilder:(context, index)=>Divider(
            color: Colors.grey[300],
          ) ,

          itemCount: widget.allFrenchisiViewModel.adressesMain.addressList.length??0,
    itemBuilder: (context, index) {
    return  Container(
      padding: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
      width: MediaQuery.of(context).size.width,
      child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getLogo(widget.allFrenchisiViewModel.adressesMain.addressList[index].addressCaption),
                SizedBox(width: 16,),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.allFrenchisiViewModel.adressesMain.addressList[index].addressCaption,style: Theme.of(context).textTheme.subtitle1,),
                      SizedBox(height: 8,),
                      Text(widget.allFrenchisiViewModel.adressesMain.addressList[index].landmark,softWrap: true,style: Theme.of(context).textTheme.bodyText2,),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            child: Text("Edit",style: Theme.of(context).textTheme.button.copyWith(color: Theme.of(context).primaryColor,fontFamily: 'Metropolis'),),
                            onTap: (){
                              showImagePickerBottomSheet(context,widget.allFrenchisiViewModel.adressesMain.addressList[index]);
                            },
                          ),

                          SizedBox(width: 16,),

                          InkWell(
                            child: Text("Delete",style: Theme.of(context).textTheme.button.copyWith(color: Theme.of(context).primaryColor,fontFamily: 'Metropolis'),),
                            onTap: (){
                              _showMyDialog(widget.allFrenchisiViewModel.adressesMain.addressList[index].custAddressId);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )



              ],
            ),
    );
    },
          ),
        ),
      ),
    );
  }
}
