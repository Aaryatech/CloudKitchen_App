import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/request/SaveCustomer.dart';
import 'package:cloud_kitchen/ui/cantact/contactUSViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


ContactUSViewModel contactUSViewModel=ContactUSViewModel();
class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  final usernameController = TextEditingController();
final emailController = TextEditingController();
final phoneNumberController = TextEditingController();
final messageController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return Observer(
      builder:(_)=> Stack(
        children: [
          Scaffold(
            key: _scaffoldKey,
             appBar: AppBar(
                title: Text('Contact Us',style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),),
              ),
              body: SingleChildScrollView(
                        child: Observer(builder: (_){
                          return Container(
                  margin: EdgeInsets.fromLTRB(20.0,0.0,20.0,20.0),
                          child: Column(

                      children: [
                                Image.asset(
                      "images/contact-us.jpg",
                       height: MediaQuery.of(context).size.height*0.30,

                                  // height: 400,
                     // width: 300,
                      ),

                    SizedBox(height: 16,),

                    TextField(
            textAlign: TextAlign.start,
            keyboardType: TextInputType.text,
            controller: usernameController,
                      autofillHints: [AutofillHints.name],
            decoration: new InputDecoration(
                  hintText: 'Enter Your Name',
                  labelText: 'Name',
                  // errorText: contactUSViewModel.contactUSErrorState.username??"",
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
                isDense: true

            ),
          ),


                        SizedBox( height: 10,),

             TextField(
            textAlign: TextAlign.start,
            keyboardType: TextInputType.number,
            controller: phoneNumberController,
               autofillHints: [AutofillHints.telephoneNumber],
            decoration: new InputDecoration(
                  hintText: 'Enter Your Phone Number',
                  // errorText: contactUSViewModel.contactUSErrorState.phoneNumber,
                labelText: 'Number',
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
            isDense: true
            ),
          ),

            SizedBox( height: 10,),

             TextField(
            textAlign: TextAlign.start,
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
               autofillHints: [AutofillHints.email],
            decoration: new InputDecoration(
                  hintText: 'Enter Your Email Address',
                  // errorText: contactUSViewModel.contactUSErrorState.email,
                labelText: 'Email',
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
                isDense: true

            ),

             ),

  SizedBox( height: 10,),
 TextField(
            textAlign: TextAlign.start,
            keyboardType: TextInputType.emailAddress,
            controller: messageController,

            decoration: new InputDecoration(
                  hintText: 'Enter Your Message',
                labelText: 'Message',

                // errorText: contactUSViewModel.contactUSErrorState.message,
                  //prefixIcon: Icon(Icons.message),
                // icon: Icon(Icons.question_answer),
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
                isDense: true

            ),
          ),


SizedBox(height: 20),

                  Container(
          //height: 50.0,
          child: GestureDetector(
                  onTap: () async{
                    //  Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfile()));
                    SaveCustomer saveCustomer= SaveCustomer();

                    saveCustomer.custName = usernameController.text;
                    saveCustomer.emailId = emailController.text;
                    saveCustomer.phoneNumber = phoneNumberController.text;
                    saveCustomer.msg= messageController.text;
                  await contactUSViewModel.saveContactUS(saveCustomer);

                  if(!contactUSViewModel.httpResponseMian.info.error){
                    _scaffoldKey.currentState.showSnackBar(
                        SnackBar(content: Text("Thanks to Connect us, Our executive will called you Shortly"),duration: Duration(seconds: 2),));

                   Future.delayed(Duration(milliseconds: 3000)).then((value) {
                     Navigator.pop(context);
                   });


                  }else{
                    _scaffoldKey.currentState.showSnackBar(
                        SnackBar(content: Text("Something went wrong,please call on support")));
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
                                      child: Text(
                                         "SEND MESSAGE",
                                         style:Theme.of(context).textTheme.button.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.white)),
                                  ),
                                )
                            ],
                        ),
                  ),
          ),
),


                        contactUSViewModel.isLoading?LinearProgressIndicator():Container(),

                      ],
                  ),
                );
                        })
              ),
          ),

          (contactUSViewModel.isLoading)?Container(
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
    );
  }
}