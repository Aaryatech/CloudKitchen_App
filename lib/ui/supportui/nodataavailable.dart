

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
          Card(
            color: Colors.transparent,
            elevation: 0,
            child: SizedBox(
                height: MediaQuery.of(context).size.height*.40,
                width: MediaQuery.of(context).size.width,
                child: Image.asset("images/sorry_pic.png")),
          ),
          SizedBox(height: 16,),
          Text("Sorry online ordering isn't available  in $address yet,We'll be there hang tight!",style: Theme.of(context).textTheme.subtitle2,),
        ],
      ),
    );
  }
}
