
import 'package:cloud_kitchen/ui/user/profile.dart';
import 'package:cloud_kitchen/ui/seprator.dart';
import 'package:cloud_kitchen/viewmodel/deliveryinstruction/deliveryinstructionviewmodel.dart';
import 'package:cloud_kitchen/viewmodel/franchisi/frviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


DIViewModel diViewModel=DIViewModel();
class DeliveryInstruction extends StatefulWidget {

  AllFrenchisiViewModel allFrenchisiViewModel;

   DeliveryInstruction({this.allFrenchisiViewModel});


  @override
  _DeliveryInstructionState createState() => _DeliveryInstructionState();
}


class _DeliveryInstructionState extends State<DeliveryInstruction> {
int selectedRadioTile,selectedRadio,selectedRadioTiles;
var _valueC = false;
@override
  void initState() {
    // TODO: implement initState
  diViewModel.getInstruction();
    super.initState();
    selectedRadio = 1;
  selectedRadioTile = 1;
  selectedRadioTiles=2;

  diViewModel.selected= widget.allFrenchisiViewModel.deliveryInstruction.instruId;
  diViewModel.selectedReson= widget.allFrenchisiViewModel.deliveryInstruction.instructnCaption;

  }
void onChecked(bool value) {
    setState(() {
      _valueC = value;
      print('value: $value');

    });
     widget.allFrenchisiViewModel.deliveryInstruction.instructnCaption=    '${widget.allFrenchisiViewModel.deliveryInstruction.instructnCaption}-Don\'t ring the bell';
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
          title: Text('Delivery Instructions',style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),),
        ),
          body: Observer(
            builder:(_)=> Column(
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


   (!diViewModel.isLoading)? Observer(
     builder:(_)=> Expanded(
       child: ListView.separated(
         physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: diViewModel.deliveryInstructionMain.deliveryInstruction.length,
        separatorBuilder: (context, index) => Divider(
        color: Colors.black,
        ),
        itemBuilder: (context, index) {
          return RadioListTile(value: diViewModel.selected, groupValue: index, onChanged:(flag) {

            setState(() {
              diViewModel.setSelectedvalue(index);
              widget.allFrenchisiViewModel.setDeliveryInstruction(diViewModel.deliveryInstructionMain.deliveryInstruction[index]);
            });

          },
            title: Text(diViewModel.deliveryInstructionMain.deliveryInstruction[index].instructnCaption??""),
            subtitle: Text(diViewModel.deliveryInstructionMain.deliveryInstruction[index].description??""),
            dense: true,
            activeColor: Theme.of(context).primaryColor,
          );
        },
        ),
     ),
   ):Container(),


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
              activeColor: Theme.of(context).primaryColor,
                ),

                   Text("Don't ring the bell",style:Theme.of(context).textTheme.bodyText1.copyWith(color:Colors.black)),
         ],
      ),
 ),

     Container(
       margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
    //height: 50.0,
    child: GestureDetector(
              onTap: () {

                Navigator.pop(context);

                 // Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileScreen()));
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



                  diViewModel.isLoading?Container(
                    height: 4,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(16),
                    child: LinearProgressIndicator(
                      valueColor:AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor) ,
                    ),
                  ):Container(),


                ],
        ),
          ),
    );
  }


}