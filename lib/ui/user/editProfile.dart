import 'package:cloud_kitchen/local/prefs.dart';
import 'package:cloud_kitchen/network/model/request/SaveCustomer.dart';
import 'package:cloud_kitchen/viewmodel/franchisi/frviewmodel.dart';
import 'package:cloud_kitchen/viewmodel/user/profileDetailsViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
final addressController = TextEditingController();
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
@override
  void initState() {
    // TODO: implement initState
   var  myLocalPrefes = MyLocalPrefes();
  //  String phone = myLocalPrefes.getCustPhone();
  //  print(phone);
    profileDetailsViewModel.getUserDetailsIfExist();
  }

@override
void dispose() {
  // Clean up the controller when the widget is removed from the
  // widget tree.
  usernameController.dispose();
  emailController.dispose();
  phoneNumberController.dispose();
  addressController.dispose();
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
                  title: Text('Edit Profile'),
                ),
                body: Container(
                  child: SingleChildScrollView(
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

                      addressController.value = TextEditingValue(
                        text: profileDetailsViewModel.address,
                        selection: TextSelection.fromPosition(
                          TextPosition(offset: profileDetailsViewModel.address.length),
                        ),
                      );
                      id = profileDetailsViewModel.gender;
                      return Container(
                      height: MediaQuery.of(context).size.height,
                      margin: EdgeInsets.fromLTRB(20.0,0.0,20.0,20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                             SizedBox( height: 20,),


                        TextField(
                          controller: usernameController,
              textAlign: TextAlign.start,
              keyboardType: TextInputType.text,
              onChanged: ((str) { profileDetailsViewModel.username=str;}),
              decoration: new InputDecoration(
                      hintText: 'Enter Your Name',
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
 TextField(
   controller: addressController,
              textAlign: TextAlign.start,
              keyboardType: TextInputType.emailAddress,
              onChanged: ((str) => profileDetailsViewModel.address),
              decoration: new InputDecoration(
                      hintText: 'Address',
                      errorText: profileDetailsViewModel.profileDetailsErrorState.address,
                      //prefixIcon: Icon(Icons.message),
                      prefixIcon: Padding(
                      padding: const EdgeInsetsDirectional.only(start: 0.0),
                      child: Icon(Icons.question_answer), // Change this icon as per your requirement
                    ),
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



SizedBox(height: 8),

                      Container(
            //height: 50.0,
            child: GestureDetector(
                      onTap: () {
                        //  Navigator.push(context, MaterialPageRoute(builder: (context)=> DeliveryInstruction()));
                        SaveCustomer saveCustomer = SaveCustomer();
                        saveCustomer.custName = usernameController.text;
                        saveCustomer.emailId = emailController.text;
                        saveCustomer.phoneNumber = phoneNumberController.text;
                        saveCustomer.address = addressController.text;
                        saveCustomer.gender = id;
                        saveCustomer.custId = profileDetailsViewModel.getCustID();
                        saveCustomer.whatsappNo="";
                        saveCustomer.profilePic="";
                        saveCustomer.gender=id;
                        saveCustomer.custDob="2020-10-10";
                        saveCustomer.ageGroup="";
                        saveCustomer.langId=1;
                        saveCustomer.compId=1;
                        saveCustomer.cityId=1;
                        saveCustomer.frId=0;
                        saveCustomer.isBuissHead=0;
                        saveCustomer.companyName="";
                        saveCustomer.gstNo="";

                        saveCustomer.isActive=0;
                        saveCustomer.delStatus=0;
                        saveCustomer.custAddPlatform=2;
                        saveCustomer.custAddDatetime="2020-10-23 10:30:50";
                        saveCustomer.addedFromType="2";
                        saveCustomer.userId=0;
                        saveCustomer.isPremiumCust=0;
                        saveCustomer.exInt1=0;
                        saveCustomer.exInt2=0;
                        saveCustomer.exInt3=0;
                        saveCustomer.exInt4=0;
                        saveCustomer.exInt5=0;
                        saveCustomer.exVar1="";
                        saveCustomer.exVar2="";
                        saveCustomer.exVar3="";
                        saveCustomer.exVar4="";
                        saveCustomer.exVar5="";
                        saveCustomer.exFloat1=0;
                        saveCustomer.exFloat2=0;
                        saveCustomer.exFloat3=0;
                        saveCustomer.exFloat4=0;
                        saveCustomer.exFloat5=0;


                        FocusScope.of(context).unfocus();
                        profileDetailsViewModel.saveUserDetails(saveCustomer).then((value) {
                          if(value){
                          _scaffoldKey.currentState.showSnackBar(
                                SnackBar(content: Text("Profile Updated Successfully"),duration: Duration(milliseconds: 1500),));

                          widget.allFrenchisiViewModel.setCustName(usernameController.text);
                          Future.delayed(Duration(seconds: 3)).then((value) {


                            Navigator.pop(context);
                          });

                          }
                        });
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
                                child: Text(
                                   "SAVE",
                                   style:Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.white)),
                            ),
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
}