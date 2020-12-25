import 'package:cloud_kitchen/network/model/request/bulkorder.dart';
import 'package:cloud_kitchen/ui/dairymart/dairymart.dart';
import 'package:cloud_kitchen/viewmodel/bulkorderviewmodel/bulkorderviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

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
                keyboardType: TextInputType.text,
                autofillHints: [AutofillHints.name],
                onChanged: ((str) { }),
                controller:nameTextController,
                decoration: new InputDecoration(
                  hintText: 'Name',
                  labelText: 'Name',
                  // errorText: profileDetailsViewModel.profileDetailsErrorState.username,
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
                keyboardType: TextInputType.text,
                autofillHints: [AutofillHints.email],
                onChanged: ((str) { }),
                controller: emailTextController,
                decoration: new InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  // errorText: profileDetailsViewModel.profileDetailsErrorState.username,
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
                keyboardType: TextInputType.text,
                autofillHints: [AutofillHints.telephoneNumber],
                onChanged: ((str) { }),
                controller: mobileNoTextController,
                decoration: new InputDecoration(
                  hintText: 'Mobile No',
                  labelText: 'Mobile No',
                  // errorText: profileDetailsViewModel.profileDetailsErrorState.username,
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
              TextField(
                textAlign: TextAlign.start,
                keyboardType: TextInputType.text,
                autofillHints: [AutofillHints.birthday],
                onChanged: ((str) { }),
                controller: dateTextController,
                decoration: new InputDecoration(
                  hintText: 'Date',
                  labelText: 'Preferred Date',
                  // errorText: profileDetailsViewModel.profileDetailsErrorState.username,
                  prefixIcon: Icon(Icons.date_range),
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
                onChanged: ((str) { }),
                controller: noOfPeopleTextController,
                decoration: new InputDecoration(
                  hintText: 'No. of people',
                  labelText: 'No. of people',
                  // errorText: profileDetailsViewModel.profileDetailsErrorState.username,
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
                onChanged: ((str) { }),
                controller: companyNameTextController,
                decoration: new InputDecoration(
                  hintText: 'Company Name(optional)',
                  labelText: 'Company Name',
                  // errorText: profileDetailsViewModel.profileDetailsErrorState.username,
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
                keyboardType: TextInputType.text,
                autofillHints: [AutofillHints.postalAddress],
                onChanged: ((str) { }),
                controller: addressTextController,
                decoration: new InputDecoration(
                  hintText: 'Address',
                  labelText: 'Address',
                  // errorText: profileDetailsViewModel.profileDetailsErrorState.username,
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
                  onTap: (){
                    bulkOrderViewModel.placeBulkOrder(BulkOrderModel(
                      time: dateTextController.text,
                      email: emailTextController.text,
                      number: mobileNoTextController.text,
                      name: nameTextController.text,
                      address: addressTextController.text,
                      people: noOfPeopleTextController.text,
                    )).then((value) {
                      _scaffoldKey.currentState.showSnackBar(
                          SnackBar(content: Text("Order Placed Successfully",style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.white),),backgroundColor: Colors.green,));
                      Future.delayed(Duration(seconds: 3)).then((value) =>
                      Navigator.of(context).pop(),
                      );
                    }
                    );
                  },
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
                      bulkOrderViewModel.isLoading?LinearProgressIndicator():Container(),
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
