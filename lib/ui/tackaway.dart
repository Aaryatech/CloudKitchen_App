import 'package:cloud_kitchen/ui/HomeScreen.dart';
import 'package:flutter/material.dart';

class TakeAway extends StatefulWidget {
  @override
  _TakeAwayState createState() => _TakeAwayState();
}

class _TakeAwayState extends State<TakeAway> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            Stack(
            overflow:Overflow.visible,
              children: [
                Container(

                  color: Colors.red,
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            Icon(Icons.arrow_back,color: Colors.white,),
                            SizedBox(width: 8,),
                            Text('Takeaway',style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),


                Positioned(
                  bottom: -60,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(padding: EdgeInsets.all(16),
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Your Location",style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.grey),),

                              SizedBox(height: 8,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Row(
                                    children: [
                                      Icon(Icons.check_circle,color: Colors.red,size: 16,),
                                      SizedBox(width: 8,),
                                      Text('Canada Corner,Nashik,Maharastra',style: Theme.of(context).textTheme.bodyText2.copyWith(fontWeight: FontWeight.w600),)
                                    ],

                                  ),
                                  Text("CHANGE",style: Theme.of(context).textTheme.caption.copyWith(color: Colors.red,),)

                                ],
                              )
                            ],
                          ),
                        ),

                      ),
                    ),
                  ),
                )

              ],
            ),


            SizedBox(height: 40,),


            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Your Nearest Restaurent',style: Theme.of(context).textTheme.subtitle2,),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1,color: Colors.grey)
              ),
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width:70,
                    height: 70,
                    child: Image.asset('images/dish.png')),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('City Center Mall Nashik',style: Theme.of(context).textTheme.subtitle2,),

                      SizedBox(height: 4,),
                      SizedBox(
                          width: MediaQuery.of(context).size.width-145,
                          child: Text('Satvik Near Purnima Bus Depot Nashik Shop No 123 Ground Floor Satvik Hotel Near Camel House Nashik Phone Number-0253 1234567',style: Theme.of(context).textTheme.caption.copyWith(color: Colors.grey),)),
                      SizedBox(height: 16,),

                      SizedBox(
                        width: MediaQuery.of(context).size.width-145,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Open:',style: Theme.of(context).textTheme.subtitle2.copyWith(fontWeight: FontWeight.w600),),
                                Text('10:57AM to 11:00 PM',style: Theme.of(context).textTheme.caption.copyWith(color: Colors.grey),)
                              ],
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Distance:',style: Theme.of(context).textTheme.subtitle2.copyWith(fontWeight: FontWeight.w600),),
                                Text('16 Km (2 min ride)',style: Theme.of(context).textTheme.caption.copyWith(color: Colors.grey),)
                              ],
                            ),
                          ],
                        ),
                      ),



                      SizedBox(height: 16,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width-145,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('VIEW ON MAP',style: Theme.of(context).textTheme.caption.copyWith(color: Colors.red),),


                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                color: Colors.red,
                                child: Text('SELECT',style: Theme.of(context).textTheme.caption.copyWith(color: Colors.white),),
                              ),
                            )

                          ]
                          ,
                        ),
                      ),



                    ],
                  ),
                )

              ],


              ),
            ),


            Center(
              child: RaisedButton(
                  onPressed: (){},
                child: Text("VIEW MORE RESTAURENTS",style: Theme.of(context).textTheme.caption.copyWith(color: Colors.grey),),

              ),
            )


          ],
        ),
      ),
    ));
  }
}
