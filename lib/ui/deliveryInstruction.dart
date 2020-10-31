import 'package:cloud_kitchen/ui/profile.dart';
import 'package:cloud_kitchen/ui/seprator.dart';
import 'package:flutter/material.dart';

class DeliveryInstruction extends StatefulWidget {
  @override
  _DeliveryInstructionState createState() => _DeliveryInstructionState();
}

class _DeliveryInstructionState extends State<DeliveryInstruction> {
int selectedRadioTile,selectedRadio,selectedRadioTiles;
var _valueC = false;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedRadio = 1;
  selectedRadioTile = 1;
  selectedRadioTiles=2;
 
  }
void onChecked(bool value) {
    setState(() {
      _valueC = value;
      print('value: $value');
    });
  }
setSelectedRadioTile(int val) {
  setState(() {
    selectedRadioTile = val;
  });

}
 setSelectedRadioTiles(int val) {
  setState(() {
    selectedRadioTiles = val;
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Delivery Instructions'),
        ),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
             Container(

             child: Column(
               children:[

                 SizedBox(height:10.0),
               ListTile(
                   leading: Icon(Icons.home,size: 32.0,color: Colors.black,),
          //title: Text('item $index'),
                   title: Text('Address',style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.black)),
                   subtitle: Text('Peta poti apartment,4 floor,Mahavir nagar,Metdinagar,Vejalpur', style:Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                    
                 ),
                 SizedBox(height:10.0),
                    const MySeparator(color: Colors.grey), 
                    
                    
               ],               
      ),
                 ),
                 
      //),


RadioListTile(
  value: 1,
  groupValue: selectedRadioTile,
  title: Text("Contactless delivery at the door",style:Theme.of(context).textTheme.bodyText1.copyWith(color:Colors.black)),
  //subtitle: Text("Radio 1 Subtitle"),
  onChanged: (val) {
    print("Radio Tile pressed $val");
    setSelectedRadioTile(val);
  },
 // activeColor: Theme.of(context).primaryColor,
  // secondary: OutlineButton(
  //   child: Text("Say Hi"),
  //   onPressed: () {
  //     print("Say Hello");
  //   },
  // ),
  selected: false,
),
RadioListTile(
  value: 2,
  groupValue: selectedRadioTile,
  title: Text("Contactless delivery to guard",style:Theme.of(context).textTheme.bodyText1.copyWith(color:Colors.black)),
  //subtitle: Text("Radio 2 Subtitle"),
  onChanged: (val) {
    print("Radio Tile pressed $val");
    setSelectedRadioTile(val);
  },
  //activeColor: Theme.of(context).primaryColor,
  // secondary: OutlineButton(
  //   child: Text("Say Hi"),
  //   onPressed: () {
  //     print("Say Hello");
  //   },
  // ),
  selected: false,
),


RadioListTile(
  value: 3,
  groupValue: selectedRadioTile,
  title: Text("Hand me the order",style:Theme.of(context).textTheme.bodyText1.copyWith(color:Colors.black)),
  subtitle: Text("Order will be given directly to you.",style:Theme.of(context).textTheme.caption.copyWith(color:Colors.grey)),
  onChanged: (val) {
    print("Radio Tile pressed $val");
    setSelectedRadioTile(val);
  },
  //activeColor: Theme.of(context).primaryColor,
  // secondary: OutlineButton(
  //   child: Text("Say Hi"),
  //   onPressed: () {
  //     print("Say Hello");
  //   },
  // ),
  selected: false,
),

  Divider(
     color: Colors.grey,
  ),

            Container(
             // margin: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 10.0),
              padding: EdgeInsets.only(left: 32),
                child: Text("Addtional Instructions",style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.black)),),

 Container(
   padding: EdgeInsets.only(left: 16),
   child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[

          new Checkbox(value: _valueC,
              onChanged: onChecked,
              ),

                 Text("Don't ring the bell",style:Theme.of(context).textTheme.bodyText1.copyWith(color:Colors.black)),
         ],
      ),
 ),

 Divider(
    color: Colors.grey,
 ),


 RadioListTile(
  value: 1,
  groupValue: selectedRadioTiles,
  title: Text("Apply for all order at this address",style:Theme.of(context).textTheme.bodyText1.copyWith(color:Colors.black)),
  //subtitle: Text("Radio 2 Subtitle"),
  onChanged: (val) {
    print("Radio Tile pressed $val");
    setSelectedRadioTiles(val);
  },
  //activeColor: Theme.of(context).primaryColor,
  // secondary: OutlineButton(
  //   child: Text("Say Hi"),
  //   onPressed: () {
  //     print("Say Hello");
  //   },
  // ),
  selected: false,
),


RadioListTile(
  value: 2,
  groupValue: selectedRadioTiles,
  title: Text("Apply for this order only",style:Theme.of(context).textTheme.bodyText1.copyWith(color:Colors.black)),
  subtitle: Text("You can edit this later in your address book",style:Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
  onChanged: (val) {
    print("Radio Tile pressed $val");
    setSelectedRadioTile(val);
  },
  //activeColor: Theme.of(context).primaryColor,
  // secondary: OutlineButton(
  //   child: Text("Say Hi"),
  //   onPressed: () {
  //     print("Say Hello");
  //   },
  // ),
  selected: false,
),

     Container(
       margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
    //height: 50.0,
    child: GestureDetector(
            onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileScreen()));
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
                  style:Theme.of(context).textTheme.button.copyWith(color:Colors.white)),
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
  }
}