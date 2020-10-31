
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MenuDetails extends StatefulWidget {
  @override
  _MenuDetailsState createState() => _MenuDetailsState();
}

class _MenuDetailsState extends State<MenuDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 250,
                      child: PageView(

                        children: [
                          Image.asset('images/loginbg.jpg',width: MediaQuery.of(context).size.width,fit: BoxFit.fill,height: 250,),
                          Image.asset('images/loginbg.jpg',width: MediaQuery.of(context).size.width,fit: BoxFit.fill,height: 250,),
                          Image.asset('images/loginbg.jpg',width: MediaQuery.of(context).size.width,fit: BoxFit.fill,height: 250,),
                        ],
                      ),
                    ),




                    Container(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.all(4),
                                padding: EdgeInsets.all(4),
                                color: Theme.of(context).primaryColor,
                                child: Icon(Icons.star,color: Colors.white,size: 16,),
                              ),

                              Container(
                                margin: EdgeInsets.all(4),
                                padding: EdgeInsets.all(4),
                                color: Theme.of(context).primaryColor,
                                child: Icon(Icons.star,color: Colors.white,size: 16,),
                              ),

                              Container(
                                margin: EdgeInsets.all(4),
                                padding: EdgeInsets.all(4),
                                color: Theme.of(context).primaryColor,
                                child: Icon(Icons.star,color: Colors.white,size: 16,),
                              ),

                              Container(
                                margin: EdgeInsets.all(4),
                                padding: EdgeInsets.all(4),
                                color: Theme.of(context).primaryColor,
                                child: Icon(Icons.star,color: Colors.white,size: 16,),
                              ),

                              Container(
                                margin: EdgeInsets.all(4),
                                padding: EdgeInsets.all(4),
                                color: Colors.grey,
                                child: Icon(Icons.star,color: Colors.white,size: 16,),
                              ),

                              SizedBox(width: 8,),
                              Text('3.5',style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold),)
                            ],
                          ),

                          Row(children: [
                            Text("R100",style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold,color: Colors.redAccent),),
                            SizedBox(width: 4,),
                            Text("R90",style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold,color: Colors.grey,decoration: TextDecoration.lineThrough),),
                          ],)
                        ],
                      ),
                    ),

                    Container(
                        padding: EdgeInsets.only(left: 16,right: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Parivar Nasta ans Dosa Point',style: Theme.of(context).textTheme.headline6,),
                        Text('Quick Nites - South Indian ,Breakfast, Dinner ,Lunch Parijat Nagar,Near Mumbai Naka ,Maharastra',style: Theme.of(context).textTheme.caption,),


                      ],
                    )),

                    SizedBox(height: 16,),
                    Container(height: 1,
                    color: Colors.grey[300],),


                    Container(
                        padding: EdgeInsets.only(left: 16,right: 16,top: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.poll_rounded),
                                SizedBox(width: 4,),
                                Text('4075+ people orderd from here since lockdown',style: Theme.of(context).textTheme.bodyText1,),
                              ],
                            ),

                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: TextField(
                                    decoration: InputDecoration(

                                      hintText: 'Enter Amount',
                                      hintStyle: Theme.of(context).textTheme.caption
                                    ),
                                  ),
                                ),

                                SizedBox(width: 8,),

                                Container(
                                  height: 30,
                                  color: Colors.grey,
                                  width: 1,

                                ),

                                SizedBox(width: 8,),

                                SizedBox(
                                    width: 240,
                                    height: 45,
                                    child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                        itemCount: 7,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Container(
                                        margin: EdgeInsets.all(4),
                                          padding: EdgeInsets.all(8),
                                          color: Theme.of(context).primaryColor,
                                          child: Text('  R50.00  ', style: TextStyle(color: Colors.white)));
                                    }

                                ),
                                  ),



                              ],
                            ),

                            SizedBox(height: 16,),
                            Container(height: 1,
                              color: Colors.grey[300],),
                          ],
                        )
                    ),


                    Container(
                        padding: EdgeInsets.only(left: 16,right: 16,top: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Coupons for you',style: Theme.of(context).textTheme.headline6,),

                            SizedBox(height: 16,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 70,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 7,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Container(
                                        margin: EdgeInsets.all(4),
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey)
                                        ),
                                        child: Row(
                                          children: [

                                            Icon(Icons.local_offer_outlined,color: Theme.of(context).primaryColor,),
                                            SizedBox(width: 8,),

                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Up to 1000 0...', style: Theme.of(context).textTheme.headline6.copyWith()),
                                                Text('use code BIGT...', style: TextStyle()),
                                              ],
                                            ),
                                          ],
                                        ));
                                  }

                              ),
                            ),

                            SizedBox(height: 16,),
                            Container(height: 1,
                              color: Colors.grey[300],),

                          SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Text('Related Items',style: Theme.of(context).textTheme.subtitle1),
                            Text('View All',style: Theme.of(context).textTheme.caption.copyWith(color: Theme.of(context).primaryColor),),
                          ],),

                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> MenuDetails()));

                              },
                              child: Container(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:  CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Stack(
                                            children: <Widget>[
                                              Container(
                                                width: 100,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage('images/loginbg.jpg'),
                                                      fit: BoxFit.cover),
                                                  borderRadius:
                                                  new BorderRadius.circular(10.0),
                                                ),
                                              ),

                                              Container(
                                                alignment: Alignment.topLeft,
                                                //padding: EdgeInsets.all(10),
                                                margin: const EdgeInsets.all(8),
                                                height: 20,
                                                // width: 80,
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    Image.asset(
                                                      "images/veg_icn.png",
                                                      height: 10,
                                                      width: 10,
                                                    ),
                                                  ],
                                                ),
                                              ),


                                            ],
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 10.0),
                                        child: new Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[

                                            Text(
                                              "Veg Schezwan Noodles",
                                              style: Theme.of(context).textTheme.subtitle1,
                                              textAlign: TextAlign.start,
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Flexible(
                                              child: Text(
                                                "In Fried Rice and Noodles",
                                                style: Theme.of(context).textTheme.bodyText2,
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),


                                            GestureDetector(
                                              onTap: () {
                                                // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.pink[100],
                                                    style: BorderStyle.solid,
                                                    width: 1.0,
                                                  ),
                                                  color:Theme.of(context).primaryColor.withOpacity(0.2),
                                                  borderRadius: BorderRadius.circular(4.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(2.0),
                                                  child: Text(
                                                      "BEST SELLER",
                                                      style:Theme.of(context).textTheme.caption.copyWith(color:Colors.orange,fontSize: 10)),
                                                ),
                                              ),
                                            ),



                                            new Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[

                                                Icon(Icons.star, color: Colors.yellow,size: 12,),

                                                SizedBox(
                                                  width: 4,
                                                ),

                                                Icon(Icons.star, color: Colors.yellow,size: 12,),

                                                SizedBox(
                                                  width: 4,
                                                ),

                                                Icon(Icons.star, color: Colors.yellow,size: 12,),
                                                SizedBox(
                                                  width: 4,
                                                ),

                                                Icon(Icons.star, color: Colors.yellow,size: 12,),

                                                SizedBox(
                                                  width: 4,
                                                ),

                                                Icon(Icons.star, color: Colors.grey,size: 12,),
                                                Text('170 Votes',style: Theme.of(context).textTheme.bodyText1,)

                                              ],
                                            ),

                                            Text('Rs 170'),

                                          ],
                                        ),
                                      ),

                                      Container(
                                          padding: EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.grey)
                                          ),

                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [

                                              Icon(Icons.add,size: 16,),
                                              SizedBox(width: 2,),

                                              Text("1",style: Theme.of(context).textTheme.caption.copyWith(color: Theme.of(context).primaryColor),),
                                              SizedBox(width: 2,),

                                              Icon(Icons.linear_scale,size: 16,),
                                            ],
                                          )
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> MenuDetails()));

                              },
                              child: Container(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:  CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Stack(
                                            children: <Widget>[
                                              Container(
                                                width: 100,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage('images/loginbg.jpg'),
                                                      fit: BoxFit.cover),
                                                  borderRadius:
                                                  new BorderRadius.circular(10.0),
                                                ),
                                              ),

                                              Container(
                                                alignment: Alignment.topLeft,
                                                //padding: EdgeInsets.all(10),
                                                margin: const EdgeInsets.all(8),
                                                height: 20,
                                                // width: 80,
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    Image.asset(
                                                      "images/veg_icn.png",
                                                      height: 10,
                                                      width: 10,
                                                    ),
                                                  ],
                                                ),
                                              ),


                                            ],
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 10.0),
                                        child: new Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[

                                            Text(
                                              "Veg Schezwan Noodles",
                                              style: Theme.of(context).textTheme.subtitle1,
                                              textAlign: TextAlign.start,
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Flexible(
                                              child: Text(
                                                "In Fried Rice and Noodles",
                                                style: Theme.of(context).textTheme.bodyText2,
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),


                                            GestureDetector(
                                              onTap: () {
                                                // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.pink[100],
                                                    style: BorderStyle.solid,
                                                    width: 1.0,
                                                  ),
                                                  color:Theme.of(context).primaryColor.withOpacity(0.2),
                                                  borderRadius: BorderRadius.circular(4.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(2.0),
                                                  child: Text(
                                                      "BEST SELLER",
                                                      style:Theme.of(context).textTheme.caption.copyWith(color:Colors.orange,fontSize: 10)),
                                                ),
                                              ),
                                            ),



                                            new Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[

                                                Icon(Icons.star, color: Colors.yellow,size: 12,),

                                                SizedBox(
                                                  width: 4,
                                                ),

                                                Icon(Icons.star, color: Colors.yellow,size: 12,),

                                                SizedBox(
                                                  width: 4,
                                                ),

                                                Icon(Icons.star, color: Colors.yellow,size: 12,),
                                                SizedBox(
                                                  width: 4,
                                                ),

                                                Icon(Icons.star, color: Colors.yellow,size: 12,),

                                                SizedBox(
                                                  width: 4,
                                                ),

                                                Icon(Icons.star, color: Colors.grey,size: 12,),
                                                Text('170 Votes',style: Theme.of(context).textTheme.bodyText1,)

                                              ],
                                            ),

                                            Text('Rs 170'),

                                          ],
                                        ),
                                      ),

                                      Container(
                                          padding: EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.grey)
                                          ),

                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [

                                              Icon(Icons.add,size: 16,),
                                              SizedBox(width: 2,),

                                              Text("1",style: Theme.of(context).textTheme.caption.copyWith(color: Theme.of(context).primaryColor),),
                                              SizedBox(width: 2,),

                                              Icon(Icons.linear_scale,size: 16,),
                                            ],
                                          )
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 8,),

                            Container(height: 1,
                              color: Colors.grey[300],),
                            SizedBox(height: 8,),


                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Rating and Review',style: Theme.of(context).textTheme.subtitle1,),

                                  SizedBox(height: 8,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [

                                Text('5 star'),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*.6,
                                  child: LinearProgressIndicator(
                                    value: 0.56,
                                    minHeight: 8,
                                    backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                                    valueColor: new AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),

                                  ),
                                ),
                                Text('56%'),

                              ],
                                  ),

                                  SizedBox(height: 4,),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                                    children: [

                                      Text('4 star'),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width*.6,
                                        child: LinearProgressIndicator(
                                          value: 0.23,
                                          minHeight: 8,
                                          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                                          valueColor: new AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),

                                        ),
                                      ),
                                      Text('23%'),

                                    ],
                                  ),

                                  SizedBox(height: 4,),


                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                                    children: [

                                      Text('3 star'),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width*.6,
                                        child: LinearProgressIndicator(
                                          value: 0.11,
                                          minHeight: 8,
                                          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                                          valueColor: new AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                                        ),
                                      ),
                                      Text('11%'),

                                    ],
                                  ),

                                  SizedBox(height: 4,),


                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                                    children: [

                                      Text('2 star'),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width*.6,
                                        child: LinearProgressIndicator(
                                          value: 0.06,
                                          minHeight: 8,
                                          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                                          valueColor: new AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                                        ),
                                      ),
                                      Text('6%'),

                                    ],
                                  ),


                                  SizedBox(height: 4,),


                                  Row(

                                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                                    children: [

                                      Text('1 star'),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width*.6,
                                        child: LinearProgressIndicator(
                                          value: 0.04,
                                          minHeight: 8,
                                          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                                          valueColor: new AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                                        ),
                                      ),
                                      Text('4%'),

                                    ],
                                  ),


                                  SizedBox(height: 8,),

                                  Container(height: 1,
                                    color: Colors.grey[300],),
                                  SizedBox(height: 16,),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Rate The Product',style: Theme.of(context).textTheme.subtitle1),
                                      Text('Top Rated',style: Theme.of(context).textTheme.caption.copyWith(color: Theme.of(context).primaryColor),),
                                    ],),



                                  SizedBox(height: 16,),

                              Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width*0.7,
                                  child: RatingBar(
                                    initialRating: 3,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ),
                              ),

                                  SizedBox(height: 16),

                                  Center(
                                    child: RaisedButton(
                                        child: Text('SUBMIT'),
                                        onPressed: (){}

                                    ),
                                  ),

                                  SizedBox(height: 50,),


                                ],
                              ),
                            )

                          ],
                        )
                    ),



                  ],
                ),
              ),
            ),








            Positioned(
              bottom: 1,
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 16,right: 16),
                color: Theme.of(context).primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                      children: [
                        Text('1 Item',style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white),),
                        Container(height: 20,
                          margin: EdgeInsets.only(left: 8,right: 8),
                          color: Colors.blueGrey,
                          width: 1,
                        ),

                        Text('R 90',style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white)),

                      ],
                    ),

                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)
                      ),
                      child: Text('Add to cart',style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white)),
                    )


                  ],
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}
