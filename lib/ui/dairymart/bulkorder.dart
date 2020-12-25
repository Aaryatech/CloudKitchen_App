import 'package:cloud_kitchen/network/model/request/bulkorder.dart';
import 'package:cloud_kitchen/ui/dairymart/dairymart.dart';
import 'package:cloud_kitchen/viewmodel/bulkorderviewmodel/bulkorderviewmodel.dart';
import 'package:cloud_kitchen/viewmodel/con/internet.dart';
import 'package:connectivity/connectivity.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:regexpattern/regexpattern.dart';

class BulkOrder extends StatefulWidget {
  BulkOrder(this.bulkOrderViewModel);
  final BulkOrderViewModel bulkOrderViewModel;
  @override
  _BulkOrderState createState() => _BulkOrderState();
}

class _BulkOrderState extends State<BulkOrder> {




  final nameTextController=TextEditingController();
  final emailTextController=TextEditingController();
  final mobileNoTextController=TextEditingController();
  final dateTextController=TextEditingController();
  final noOfPeopleTextController=TextEditingController();
  final companyNameTextController=TextEditingController();
  final addressTextController=TextEditingController();

  String nameError,emailError,mobileError,peoplrError,companyError,addressError;

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  String selecteddateTime='${DateTime.now().add(Duration(days: 1))}';



  void  _showSnackbar(String msg,bool isPositive) {
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(msg,style: TextStyle(color: Colors.white),),
          duration: Duration(seconds: 3),
          backgroundColor: isPositive?Colors.green:Colors.redAccent,
        ));
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
      appBar:  AppBar(
      title: Text('Bulk Order',style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
            ),
          ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                textAlign: TextAlign.start,
                keyboardType: TextInputType.name,
                autofillHints: [AutofillHints.name],
                onChanged: ((str) {
                  nameError=null;
                }),
                controller:nameTextController,
                decoration: new InputDecoration(
                  hintText: 'Name',
                  labelText: 'Name',
                   errorText:nameError,
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

              SizedBox(height: 16,),

              TextField(
                textAlign: TextAlign.start,
                keyboardType: TextInputType.emailAddress,
                autofillHints: [AutofillHints.email],
                onChanged: ((str) {
                  emailError=null;
                }),
                controller: emailTextController,
                decoration: new InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                   errorText: emailError,
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
              SizedBox(height: 16,),

              TextField(
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
                maxLength: 10,
                autofillHints: [AutofillHints.telephoneNumber],
                onChanged: ((str) {
                  setState(() {
                    mobileError=null;
                  });
                }),
                controller: mobileNoTextController,
                decoration: new InputDecoration(
                  hintText: 'Mobile No',
                  labelText: 'Mobile No',
                   errorText: mobileError,
                  prefixIcon: Icon(Icons.phone_android),
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

              SizedBox(height: 16,),
              DateTimePicker(
                type: DateTimePickerType.date,
                use24HourFormat: false,
                decoration:  InputDecoration(
                    prefixIcon: Icon(Icons.calendar_today),
                    labelText: 'Schedule Delivery'
                ),
                initialValue: '${DateTime.now().add(Duration(minutes: 40))}',
                firstDate: DateTime.now().add(Duration(minutes: 40)),
                lastDate: DateTime.now().add(Duration(days: 8)),
                dateLabelText: 'Schedule Delivery',

                style: Theme.of(context).textTheme.caption,
                onChanged: (val) {
                  selecteddateTime=val;
                },
                validator: (val) {
                  print(val);
                  return null;
                },
                onSaved: (val) => print(val),
              ),
              SizedBox(height: 16,),

              TextField(
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
                onChanged: ((str) {
                  setState(() {
                    peoplrError=null;
                  });
                }),
                controller: noOfPeopleTextController,
                decoration: new InputDecoration(
                  hintText: 'No. of people',
                  labelText: 'No. of people',
                  errorText: peoplrError,
                  prefixIcon: Icon(Icons.people),
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

              SizedBox(height: 16,),
              TextField(
                textAlign: TextAlign.start,
                keyboardType: TextInputType.text,
                onChanged: ((str) {
                  setState(() {
                    companyError=null;
                  });
                }),
                controller: companyNameTextController,
                decoration: new InputDecoration(
                  hintText: 'Company Name(optional)',
                  labelText: 'Company Name',
                   errorText: companyError,
                  prefixIcon: Icon(Icons.work),
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
              SizedBox(height: 16,),
              TextField(
                textAlign: TextAlign.start,
                keyboardType: TextInputType.streetAddress,
                autofillHints: [AutofillHints.postalAddress],
                onChanged: ((str) {
                  setState(() {
                    addressError=null;
                  });
                }),
                controller: addressTextController,
                decoration: new InputDecoration(
                  hintText: 'Address',
                  labelText: 'Address',
                   errorText:addressError,
                  prefixIcon: Icon(Icons.location_on),
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
              SizedBox(height: 16,),

              Observer(
                builder:(_)=> InkWell(
                  onTap: () {
                    if (isNetWorkAvailable) {

                      bool validate=true;

                      if(nameTextController.text==""){
                        setState(() {
                          validate=false;
                          nameError="Please Enter Name";
                        });
                      }

                      if(mobileNoTextController.text==""){
                        setState(() {
                          validate=false;
                          mobileError="Please Enter Contact No";
                        });
                      }

                      if(mobileNoTextController.text.length<10){
                        setState(() {
                          validate=false;
                          mobileError="Please Enter Valid Contact No";
                        });
                      }

                      if(emailTextController.text==""){
                        setState(() {
                          validate=false;
                          emailError="Please Enter Email";
                        });
                      }

                      if(!emailTextController.text.toString().isEmail()){
                        setState(() {
                          validate=false;
                          emailError="Please Enter Valid Email";
                        });
                      }

                      if(noOfPeopleTextController.text==""){
                        setState(() {
                          validate=false;
                          peoplrError="Please Enter Number of People";
                        });
                      }


                      if(addressTextController.text==""){
                        setState(() {
                          validate=false;
                          addressError="Please Enter Address";
                        });
                      }



                      if(validate) {
                        bulkOrderViewModel.placeBulkOrder(BulkOrderModel(
                          time: dateTextController.text,
                          email: emailTextController.text,
                          number: mobileNoTextController.text,
                          name: nameTextController.text,
                          address: addressTextController.text,
                          people: noOfPeopleTextController.text,
                        )).then((value) {
                          _scaffoldKey.currentState.showSnackBar(
                              SnackBar(content: Text(
                                "Order Placed Successfully", style: Theme
                                  .of(context)
                                  .textTheme
                                  .subtitle2
                                  .copyWith(color: Colors.white),),
                                backgroundColor: Colors.green,));
                          Future.delayed(Duration(seconds: 3)).then((value) =>
                              Navigator.of(context).pop(),
                          );
                        }
                        );
                      }
                    }else {
                        _showSnackbar(
                            'Please check internet connection', false);
                      }}
                ,
                  child: Column(
                    children: [
                      Container(
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
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                      "Submit",
                                      style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.white)),

                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      bulkOrderViewModel.isLoading?LinearProgressIndicator(  backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
                        valueColor:AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor) ,
                      ):Container(),
                    ],
                  ),
                ),
              ),

            ],
          ),

        ),
      ),
      ),
    );
  }
}
