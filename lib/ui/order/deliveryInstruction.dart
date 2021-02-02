import 'package:cloud_kitchen/ui/user/profile.dart';
import 'package:cloud_kitchen/ui/seprator.dart';
import 'package:cloud_kitchen/viewmodel/deliveryinstruction/deliveryinstructionviewmodel.dart';
import 'package:cloud_kitchen/viewmodel/franchisi/frviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

DIViewModel diViewModel = DIViewModel();

class DeliveryInstruction extends StatefulWidget {
  AllFrenchisiViewModel allFrenchisiViewModel;

  DeliveryInstruction({this.allFrenchisiViewModel});

  @override
  _DeliveryInstructionState createState() => _DeliveryInstructionState();
}

class _DeliveryInstructionState extends State<DeliveryInstruction> {
  @override
  void initState() {
    // TODO: implement initState
    diViewModel.getInstruction();
    super.initState();
  }

  void onChecked(bool value) {
    setState(() {
      widget.allFrenchisiViewModel.valueC = value;
      print('value: $value');
    });
  }

  setSelectedRadioTile(int val) {
    setState(() {
      widget.allFrenchisiViewModel.selectedRadioTile = val;
    });
  }

  setSelectedRadioTiles(int val) {
    setState(() {
      widget.allFrenchisiViewModel.selectedRadioTiles = val;
    });
  }

  Widget getLogo(String caption) {
    switch (caption.toLowerCase()) {
      case 'home':
        {
          return Icon(
            Icons.home,
            color: Colors.black,
          );
        }
        break;

      case 'work':
        {
          return Icon(Icons.work, color: Colors.black);
        }
        break;

      case 'other':
        {
          return Icon(Icons.assistant_navigation, color: Colors.black);
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Delivery Instructions',
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.white),
        ),
      ),
      body: Observer(
        builder: (_) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(height: 10.0),
                  ListTile(
                    leading: getLogo(
                        widget.allFrenchisiViewModel.custAdrressCaption),
                    //title: Text('item $index'),
                    title: Text(
                        '${widget.allFrenchisiViewModel.custAdrressCaption}',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontFamily: "Metropolis Semi Bold")),
                    subtitle: Text(
                        '${widget.allFrenchisiViewModel.custAdrress}',
                        style: Theme.of(context).textTheme.caption.copyWith(
                            fontFamily: 'Metropolis', color: Colors.black54)),
                  ),
                  SizedBox(height: 10.0),
                  const MySeparator(color: Colors.grey),
                ],
              ),
            ),
            (!diViewModel.isLoading)
                ? Observer(
                    builder: (_) => Expanded(
                      child: ListView.separated(
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: diViewModel
                            .deliveryInstructionMain.deliveryInstruction.length,
                        separatorBuilder: (context, index) => Divider(
                          color: Colors.grey[300],
                        ),
                        itemBuilder: (context, index) {
                          return RadioListTile(
                            value: diViewModel.selected,
                            groupValue: index,
                            onChanged: (flag) {
                              setState(() {
                                diViewModel.setSelectedvalue(index);
                                widget.allFrenchisiViewModel
                                    .setDeliveryInstruction(diViewModel
                                        .deliveryInstructionMain
                                        .deliveryInstruction[index]);
                              });
                            },
                            title: Text(
                              diViewModel
                                      .deliveryInstructionMain
                                      .deliveryInstruction[index]
                                      .instructnCaption ??
                                  "",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  .copyWith(fontFamily: "Metropolis Semi Bold"),
                            ),
                            subtitle: Text(
                              diViewModel.deliveryInstructionMain
                                      .deliveryInstruction[index].description ??
                                  "",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  .copyWith(
                                      fontFamily: 'Metropolis',
                                      color: Colors.black54),
                            ),
                            dense: true,
                            activeColor: Theme.of(context).primaryColor,
                          );
                        },
                      ),
                    ),
                  )
                : Container(),
            Divider(
              color: Colors.grey[300],
            ),
            Container(
              // margin: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 10.0),
              padding: EdgeInsets.only(left: 32, top: 8),
              child: Text("Additional Instructions",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontWeight: FontWeight.bold)
                      .copyWith(color: Colors.black)),
            ),
            Container(
              padding: EdgeInsets.only(left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Checkbox(
                    value: widget.allFrenchisiViewModel.valueC,
                    onChanged: onChecked,
                    activeColor: Theme.of(context).primaryColor,
                  ),
                  Text("Don't ring the bell",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: Colors.black)),
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
                        SizedBox(
                          height: 28,
                          width: 4,
                        ),
                        Expanded(
                          child: Text("Save",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  .copyWith(fontWeight: FontWeight.normal)
                                  .copyWith(color: Colors.white)),
                        )
                      ],
                    ),
                  )

                  //       Container(
                  // decoration: BoxDecoration(
                  //       border: Border.all(
                  //            color: Theme.of(context).primaryColor,
                  //           style: BorderStyle.solid,
                  //           width: 1.0,
                  //       ),
                  //       color: Theme.of(context).primaryColor,
                  //       borderRadius: BorderRadius.circular(2.0),
                  // ),
                  // child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: <Widget>[
                  //           Padding(
                  //             padding: const EdgeInsets.all(10.0),
                  //             child: Center(
                  //          child: Text(
                  //               "SAVE",
                  //             style:Theme.of(context).textTheme.button.copyWith(color:Colors.white)),
                  //             ),
                  //           )
                  //       ],
                  // ),
                  //       ),
                  ),
            ),
            diViewModel.isLoading
                ? Container(
                    height: 4,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(16),
                    child: LinearProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
