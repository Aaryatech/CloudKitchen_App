import 'package:cloud_kitchen/ui/home/HomeScreen.dart';
import 'package:cloud_kitchen/ui/model/AddressBookModel.dart';
import 'package:flutter/material.dart';



class AddressBook extends StatefulWidget {
  @override
  _AddressBookState createState() => _AddressBookState();
}

class _AddressBookState extends State<AddressBook> {

  final List<AddressBookModel> address = [
    AddressBookModel(heading: 'HOME',desc: 'NCC Seventh Avenue,Model Colony Road,Pritum Nagar,Model Colony Town,Ludhiana Punjab 141002,India',icon: Icons.home),
    AddressBookModel(heading: 'OFFICE/WORK',desc: 'NCC Seventh Avenue,Model Colony Road,Pritum Nagar,Model Colony Town,Ludhiana Punjab 141002,India',icon: Icons.local_post_office),
    AddressBookModel(heading: 'OTHER',desc: 'NCC Seventh Avenue,Model Colony Road,Pritum Nagar,Model Colony Town,Ludhiana Punjab 141002,India',icon: Icons.send)

  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Address Book'),
        ),
        body: ListView.builder(
        itemCount: address.length,
    itemBuilder: (context, index) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
              },
              child: Card(

                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Expanded(
                        flex: 1,

                        child: Container(
                          color: Colors.white,
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Container(
                                child: Icon(
                                 address[index].icon, size: 32.0, color: Theme.of(context).primaryColor,),
                         ),


                              // new Text("John Doe",
                              //     textScaleFactor: 1.5)
                            ],
                          ),
                        ),

                        //  );

                      ),
                      Expanded(
                          flex: 3,

                          child: Container(
                            color: Colors.white,

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                            '${address[index].heading}',
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .subtitle1
                                        .copyWith(fontWeight: FontWeight.bold)
                                        .copyWith(color: Colors.black)),
                                SizedBox(height: 4,),
                                Text(
                                    '${address[index].desc}',
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(fontWeight: FontWeight.normal)
                                        .copyWith(color: Colors.grey)),
                                SizedBox(height: 8,),
                                Row(
                                  children: [
                                  Icon(Icons.edit, color: Colors.black,size: 15,),
                                  SizedBox(width: 4,),
                                  Text(
                                      'EDIT', style: Theme
                                      .of(context)
                                      .textTheme
                                      .button
                                      .copyWith(fontWeight: FontWeight.bold)
                                      .copyWith(color: Colors.black)),

                                    SizedBox(width: 15,),
                                    Icon(Icons.delete, color: Theme.of(context).primaryColor,size: 15,),
                                    SizedBox(width: 4,),
                                    Text(
                                        'DELETE', style: Theme
                                        .of(context)
                                        .textTheme
                                        .button
                                        .copyWith(fontWeight: FontWeight.bold)
                                        .copyWith(color: Theme.of(context).primaryColor)),

                                ],),

                              ],
                            ),

                          )

                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
        ),
      ),
    );
  }
}
