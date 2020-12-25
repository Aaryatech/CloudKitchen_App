import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoNetworkUi extends StatefulWidget {
  @override
  _NoNetworkUiState createState() => _NoNetworkUiState();
}

class _NoNetworkUiState extends State<NoNetworkUi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Card(
            color: Colors.transparent,
            elevation: 0,
            child: SizedBox(
                height: MediaQuery.of(context).size.height*.40,
                width: MediaQuery.of(context).size.width,
                child: Image.asset("images/sorry_pic.png")),
          ),
          SizedBox(height: 16,),
        ],
      ),
    );
  }
}
