import 'package:cloud_kitchen/viewmodel/terms/TermsViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

TermsViewModel termsViewModel=TermsViewModel();
class Terms extends StatefulWidget {

  final bool data;

   Terms({this.data});

  @override
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<Terms> {

  @override
  void initState() {
    // TODO: implement initState

    if(widget.data){
        termsViewModel.getTerms();
    }else{
      termsViewModel.getAbout();

    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title:Text(widget.data?"Terms & Condition":"About Us",style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),),
      ),

      body: Observer(
        builder:(_)=> SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 8,right: 8,bottom: 8),
            child:termsViewModel.isLoading?LinearProgressIndicator(
              valueColor:AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor) ,

            ): Html(data: termsViewModel.termsModel.exVarchar1,),
          ),
        ),
      ),
    ));
  }
}
