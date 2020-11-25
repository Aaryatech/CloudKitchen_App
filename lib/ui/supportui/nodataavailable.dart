

import 'package:flutter/material.dart';

class NoServiceAvailable extends StatelessWidget {
  final String address;

  const NoServiceAvailable(this.address);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height*.5,
              width: MediaQuery.of(context).size.width,
              child: Image.asset("images/sorry_pic.jpg")),
          SizedBox(height: 16,),
          Text("Sorry online ordering isn't available  in $address yet,We'll be there hang tight!"),
        ],
      ),
    );
  }
}
