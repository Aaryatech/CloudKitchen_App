import 'dart:async';

import 'package:cloud_kitchen/viewmodel/con/internet.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class NoNetWorkWidget extends StatefulWidget {
  @override
  _NoNetWorkWidgetState createState() => _NoNetWorkWidgetState();
}

class _NoNetWorkWidgetState extends State<NoNetWorkWidget> {

  ReactionDisposer _disposer;
  ConnectivityStore connectivityStore=ConnectivityStore();

  bool isNetWorkAvailable=true;
  bool ishideUi=false;

  @override
  void initState() {
    // TODO: implement initState

    _disposer = reaction(
            (_) => connectivityStore.connectivityStream.value,
            (result) {
              if(result == ConnectivityResult.none){
                setState((){
                  ishideUi=false;
                  isNetWorkAvailable=false;


               });
              }else{
                setState((){
                  isNetWorkAvailable=true;

                });
                Future.delayed(Duration(milliseconds: 1500)).then((value) {
                  setState((){
                    ishideUi=true;
                  });
                });
              }
            });

    slider();
    super.initState();
  }


  void slider(){
    Timer.periodic(Duration(milliseconds:1500 ), (Timer t)  {

      if(isNetWorkAvailable && !ishideUi){
        setState(() {
          ishideUi=true;
        });
      }

    });
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isNetWorkAvailable?Container(): AnimatedContainer(
      height: (ishideUi)?0: 30,
      duration:Duration(milliseconds: 400),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color:isNetWorkAvailable?Colors.green:Theme.of(context).primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(isNetWorkAvailable?"We are back...":'Could not connect to internet.',style: Theme.of(context).textTheme.caption.copyWith(color:Colors.white),),
      ),
    );
  }
}
