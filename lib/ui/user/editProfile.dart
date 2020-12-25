import 'dart:io';

import 'package:cloud_kitchen/local/prefs.dart';
import 'package:cloud_kitchen/local/staticUrls.dart';
import 'package:cloud_kitchen/network/model/request/SaveCustomer.dart';
import 'package:cloud_kitchen/ui/supportui/nonetworkui.dart';
import 'package:cloud_kitchen/viewmodel/con/internet.dart';
import 'package:cloud_kitchen/viewmodel/franchisi/frviewmodel.dart';
import 'package:cloud_kitchen/viewmodel/user/profileDetailsViewModel.dart';
import 'package:connectivity/connectivity.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

import 'AddressBook.dart';

final profileDetailsViewModel = ProfileDetailsViewModel();
class EditProfile extends StatefulWidget {

  AllFrenchisiViewModel allFrenchisiViewModel;
  EditProfile(this.allFrenchisiViewModel);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
int id = 1;
String radioButtonItem = 'ONE';
final usernameController = TextEditingController();
final emailController = TextEditingController();
final phoneNumberController = TextEditingController();
final dateOfBirthController = TextEditingController();
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
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
    profileDetailsViewModel.getUserDetailsIfExist();
    super.initState();
  }


Future getImage() async {
  final pickedFile = await picker.getImage(source: ImageSource.gallery);

  setState(() {
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      profileDetailsViewModel.saveUserProfileImage(_image);
    } else {
      print('No image selected.');
    }
  });
}

File _image;
final picker = ImagePicker();

@override
void dispose() {
  // Clean up the controller when the widget is removed from the
  // widget tree.
  usernameController.dispose();
  emailController.dispose();
  phoneNumberController.dispose();
  dateOfBirthController.dispose();
  super.dispose();
}


@override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Observer(
        builder:(_)=> Stack(
          children: [
            Scaffold(
              key: _scaffoldKey,
               appBar: AppBar(
                  title: Text('Edit Profile',style: Theme.of(context).textTheme.headline6.copyWith(color:Colors.white),),

               actions: [
                 TextButton(
                   child: Text('Addresses',style: Theme.of(context).textTheme.button.copyWith(color: Colors.white,fontFamily: 'Metropolis'),),
                   onPressed: (){

                     if(isNetWorkAvailable) {
                       Navigator.push(context, MaterialPageRoute(builder: (
                           context) =>
                           AddressBook(widget.allFrenchisiViewModel)));
                     }else{
                       _scaffoldKey.currentState.showSnackBar(
                           SnackBar(content: Text(
                               "Please check network connection"),
                             duration: Duration(milliseconds: 1500),backgroundColor: Colors.red,));

                     }
                   },
                 )
               ],
               ),
                body: Container(
                  child:(!isNetWorkAvailable)?NoNetworkUi(): SingleChildScrollView(
                    child: Observer(builder: (_){
                      usernameController.value = TextEditingValue(
                        text: profileDetailsViewModel.username,
                        selection: TextSelection.fromPosition(
                          TextPosition(offset: profileDetailsViewModel.username.length),
                        ),
                      );


                      emailController.value = TextEditingValue(
                        text: profileDetailsViewModel.email,
                        selection: TextSelection.fromPosition(
                          TextPosition(offset: profileDetailsViewModel.email.length),
                        ),
                      );

                      phoneNumberController.value = TextEditingValue(
                        text: profileDetailsViewModel.phoneNumber,
                        selection: TextSelection.fromPosition(
                          TextPosition(offset: profileDetailsViewModel.phoneNumber.length),
                        ),
                      );

                      // dateOfBirthController.value = TextEditingValue(
                      //   text: profileDetailsViewModel.custDob.toString(),
                      //   selection: TextSelection.fromPosition(
                      //     TextPosition(offset: profileDetailsViewModel.custDob.toString().length),
                      //   ),
                      // );

                      id = profileDetailsViewModel.gender;
                      return Container(
                      height: MediaQuery.of(context).size.height,
                      margin: EdgeInsets.fromLTRB(20.0,0.0,20.0,20.0),
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                             SizedBox( height: 12,),
                         Stack(
                           children: [
                             CircleAvatar(
                                 maxRadius: 50,
                                 backgroundImage:_image==null? '${profileDetailsViewModel.customerDetails?.profilePic??""}'==""? AssetImage('images/man.png'):NetworkImage('$profileImageUrl${profileDetailsViewModel.customerDetails.profilePic}'):FileImage(_image) ,
                                 ),
                             Positioned(
                                 bottom: 0,
                                 right: 0,
                                 child: InkWell(

                                   onTap: (){
                                     getImage();
                                   },
                                  child:

                                  Container(
                                    padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(color: Colors.grey,blurRadius: 5,offset: Offset(5,5))
                                        ],
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.circular(16)
                                      ),
                                      child: Icon( Icons.edit,color: Colors.white,size: 16,))))
                           ],
                         ),


                        SizedBox(height: 16,),

                        TextField(
                          controller: usernameController,
              textAlign: TextAlign.start,
              keyboardType: TextInputType.text,
              onChanged: ((str) { profileDetailsViewModel.username=str;}),
              decoration: new InputDecoration(
                      hintText: 'Enter Your Name',
                labelText: 'Name',
                errorText: profileDetailsViewModel.profileDetailsErrorState.username,
                      prefixIcon: Icon(Icons.person),
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(2.0),
                        ),
                        borderSide: new BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
              ),
            ),

              SizedBox( height: 10,),

               TextField(
                   controller: phoneNumberController,
              textAlign: TextAlign.start,
              keyboardType: TextInputType.number,
              enabled: false,
              onChanged: ((str){ profileDetailsViewModel.phoneNumber=str;}),
              decoration: new InputDecoration(
                      hintText: 'Enter Your Phone Number',
                labelText: 'Number',

                errorText: profileDetailsViewModel.profileDetailsErrorState.phoneNumber,
                      prefixIcon: Icon(Icons.mobile_screen_share),
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(2.0),
                        ),
                        borderSide: new BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
              ),
            ),

                            SizedBox( height: 10,),

                            TextField(
                              controller: emailController,
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.emailAddress,
                              onChanged: ((str)  {profileDetailsViewModel.email=str;}),
                              decoration: new InputDecoration(
                                hintText: 'Enter Your Email Address',
                                labelText: 'Email',
                                errorText: profileDetailsViewModel.profileDetailsErrorState.email,
                                prefixIcon: Icon(Icons.email),
                                border: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(2.0),
                                  ),
                                  borderSide: new BorderSide(
                                    color: Colors.black,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox( height: 10,),
                             DateTimePicker(
                              type: DateTimePickerType.date,
                                // controller: dateOfBirthController,
                              initialValue:profileDetailsViewModel.customerDetails?.custDob==null? '${DateTime.now()}':'${DateTime(int.parse(profileDetailsViewModel.customerDetails?.custDob?.split('-')[0]),int.parse(profileDetailsViewModel.customerDetails?.custDob?.split('-')[1]),int.parse(profileDetailsViewModel.customerDetails?.custDob?.split('-')[2]))??'${DateTime.now()}'}',
                              firstDate: DateTime(1940),
                              lastDate: DateTime.now(),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Date Of Birth',
                                prefixIcon: Icon(Icons.cake)
                              ),
                              dateLabelText: 'Date Of Birth',
                              onChanged: (val) {
                                profileDetailsViewModel.customerDetails?.custDob=val;
                              },
                              validator: (val) {
                                print(val);
                                return null;
                              },
                              onSaved: (val) => print(val),
                            ),



 Row(

                     mainAxisAlignment: MainAxisAlignment.start,

                     children: <Widget>[

                        Text('Gender: ', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 16,),),

 SizedBox( width: 8, ),

                       Radio(

                         activeColor:Theme.of(context).primaryColor,
                         value: profileDetailsViewModel.gender == null ? 1 : profileDetailsViewModel.gender,
                         groupValue: 1,
                         onChanged: (val) {
                           setState(() {
                               radioButtonItem = 'Male';
                               profileDetailsViewModel.gender  = 1;
                           });
                         },

                       ),
                       Text(
                         'Male',
                         style: new TextStyle(fontSize: 14.0,color: Colors.grey),
                       ),
                     SizedBox( width: 4, ),
                       Radio(
                         value: profileDetailsViewModel.gender == null ? 1 : profileDetailsViewModel.gender,
                         activeColor:Theme.of(context).primaryColor,
                         groupValue: 2,
                         onChanged: (val) {
                         setState(() {
                         radioButtonItem = 'Female';
                          profileDetailsViewModel.gender = 2;
                         });
                         },
                       ),

                       Text(
                         'Female',
                         style: new TextStyle(
               fontSize: 14.0,color: Colors.grey
                         ),
                       ),
                   SizedBox( width: 4, ),


 ],

                   ),


  SizedBox( height: 10,),





                            SizedBox(height: 8),




                      Container(
            //height: 50.0,
            child: GestureDetector(
                      onTap: () {

                        if(isNetWorkAvailable) {
                          //  Navigator.push(context, MaterialPageRoute(builder: (context)=> DeliveryInstruction()));

                          widget.allFrenchisiViewModel.setProUrl(
                              profileDetailsViewModel.customerDetails
                                  .profilePic);

                          SaveCustomer saveCustomer = SaveCustomer();
                          saveCustomer.custName = usernameController.text;
                          saveCustomer.emailId = emailController.text;
                          saveCustomer.phoneNumber = phoneNumberController.text;
                          saveCustomer.address = "";
                          saveCustomer.gender = id;
                          saveCustomer.custId =
                              profileDetailsViewModel.getCustID();
                          saveCustomer.whatsappNo = "";
                          saveCustomer.profilePic =profileDetailsViewModel.customerDetails.profilePic;
                          saveCustomer.gender = id;
                          saveCustomer.custDob = profileDetailsViewModel.customerDetails?.custDob;
                          saveCustomer.ageGroup = "";
                          saveCustomer.langId = 1;
                          saveCustomer.compId = 1;
                          saveCustomer.cityId = 1;
                          saveCustomer.frId = 0;
                          saveCustomer.isBuissHead = 0;
                          saveCustomer.companyName = "";


                          saveCustomer.isActive = 0;
                          saveCustomer.delStatus = 0;
                          saveCustomer.custAddPlatform = 2;
                          saveCustomer.custAddDatetime = "2020-10-23 10:30:50";
                          saveCustomer.addedFromType = "2";
                          saveCustomer.userId = 0;
                          saveCustomer.isPremiumCust = 0;
                          saveCustomer.exInt1 = 0;
                          saveCustomer.exInt2 = 0;
                          saveCustomer.exInt3 = 0;
                          saveCustomer.exInt4 = 0;
                          saveCustomer.exInt5 = 0;
                          saveCustomer.exVar1 = "";
                          saveCustomer.exVar2 = "";
                          saveCustomer.exVar3 = "";
                          saveCustomer.exVar4 = "";
                          saveCustomer.exVar5 = "";
                          saveCustomer.exFloat1 = 0;
                          saveCustomer.exFloat2 = 0;
                          saveCustomer.exFloat3 = 0;
                          saveCustomer.exFloat4 = 0;
                          saveCustomer.exFloat5 = 0;


                          FocusScope.of(context).unfocus();
                          profileDetailsViewModel.saveUserDetails(saveCustomer)
                              .then((value) {
                            if (value) {
                              _scaffoldKey.currentState.showSnackBar(
                                  SnackBar(content: Text(
                                      "Profile Updated Successfully"),
                                    duration: Duration(milliseconds: 1500),));

                              widget.allFrenchisiViewModel.setCustName(
                                  usernameController.text);
                              Future.delayed(Duration(seconds: 3)).then((
                                  value) {
                                Navigator.pop(context);
                              });
                            }
                          });
                        }else{
                          _scaffoldKey.currentState.showSnackBar(
                              SnackBar(content: Text(
                                  "Please check network connection"),
                                duration: Duration(milliseconds: 1500),backgroundColor: Colors.red,));

                        }
                      },
                      child:  Container(
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
),

                          ],
                      ),
                    );
                    })
                  ),
                )
            ),

            (profileDetailsViewModel.isLoading)?Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black.withOpacity(.3),
              child: Center(
                child: CircularProgressIndicator(
                  valueColor:AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor) ,
                ),
              ),
            ):Container(),
          ],
        ),
      ),
    );
  }

String selecteddate;

}