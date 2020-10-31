import 'dart:async';

import 'package:cloud_kitchen/ui/menudetailspage.dart';
import 'package:cloud_kitchen/ui/tackaway.dart';
import 'package:flutter/material.dart';




class HomeScreen extends StatefulWidget {




  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {






  int currentPage=0;

  PageController _controller = PageController(
    initialPage: 0,

  );

  void openCartSheet(){
    showModalBottomSheet(
        context: context,
        enableDrag: true,
        builder: (BuildContext bc){
          return StatefulBuilder(
          builder: (context, setState) {

            return SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white.withOpacity(0.5),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height-200,
                  padding: EdgeInsets.all(16),

                ),
              ),
            );
          }
      );
    }

    );

  }



  void openFilterBottomSheet(){
    showModalBottomSheet(
        context: context,
       shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enableDrag: true,
        builder: (BuildContext bc){
          return StatefulBuilder(
          builder: (context, setState) {

            return SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white.withOpacity(0.5),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height-400,
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.only(top: 24),

                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Sort and Filter',style: Theme.of(context).textTheme.subtitle2,),
                          InkWell(

                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.close))
                        ],
                      ),

                    ],

                  ),
                ),
              ),
            );
          }
      );
    }

    );

  }


  @override
  void initState() {
    // TODO: implement initState
    slider();


    super.initState();
  }


  void slider(){
    Timer.periodic(Duration(seconds: 2), (Timer t) => {
      setState((){
        if(currentPage<2) {
          _controller.nextPage(duration: Duration(milliseconds: 700),
              curve: Curves.fastLinearToSlowEaseIn);
        }else{
          currentPage=0;
          _controller.jumpToPage(0);
        }

    })
    });
  }

  final scaffoldState = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      key: scaffoldState,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {

          showDialog(context: context,
              child:

          new AlertDialog(



            title: new Text("My Super title"),

            content:  Container(
              height: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(

                    title: Text("Recommended"),
                    dense: true,
                    trailing: Text('20'),
                  ),

                  ListTile(

                    title: Text("Veg Starters"),
                    dense: true,
                    trailing: Text('12'),
                  ),

                  ListTile(

                    title: Text("Non-Veg Starters"),
                    dense: true,
                    trailing: Text('18'),
                  ),


                  ListTile(

                    title: Text("Bread Toast"),
                    dense: true,
                    trailing: Text('10'),
                  ),


                  ListTile(

                    title: Text("Jeera Rise"),
                    dense: true,
                    trailing: Text('05'),
                  ),


                  ListTile(

                    title: Text("Chinease Soups"),
                    dense: true,
                    trailing: Text('10'),
                  ),
                ],
              ),
            ),
          )
          );

        },
        icon: Icon(Icons.list),
        label: Text("Menu"),
      ),
      appBar: AppBar(

        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: <Widget>[
                Icon(Icons.location_on_outlined, color: Colors.white,size: 28,),
                SizedBox(width: 4,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Home",style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal,color:Colors.white,),textAlign: TextAlign.center,overflow: TextOverflow.clip,),
                    Text("Canda Corner College Road Nashik",style:Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.normal,color:Colors.white,),textAlign: TextAlign.center,overflow: TextOverflow.clip,),

                  ],
                ),
              ],

            ),
            SizedBox(height: 4,),
            Container(height: 1,width: MediaQuery.of(context).size.width*0.8,
           color: Colors.white60,
           )
          ],
        ),
        actions: [
          IconButton(icon:Icon( Icons.arrow_drop_down), onPressed:(){})
        ],


        backgroundColor: Theme.of(context).primaryColor,
        // elevation: 50.0,
        bottom: PreferredSize(
          preferredSize: Size.square(60.0),
          child: Container(
            //   child: Container(
            margin: EdgeInsets.only(left: 8,right: 8,bottom: 8),
            color: Theme.of(context).primaryColor,
            child: new Card(
             shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
              child:  TextFormField(
                // controller: controller,
                decoration:  InputDecoration(

                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.filter_list),
                  hintText: 'Search', border: InputBorder.none,),
                // onChanged: onSearchTextChanged,
              ),
            ),
            //),
          ),
        ),
      ),


      body:SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left:8.0,right: 8,top:8,bottom: 4),
          child:Column(
            children: <Widget>[
             Padding(
               padding: const EdgeInsets.only(left:12.0),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                  //  height: 30.0,
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xffff5959),
                            style: BorderStyle.solid,
                            width: 1.0,
                          ),
                          color:const Color(0xffff5959),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.fiber_manual_record, color: Colors.white,size: 10,),
                              SizedBox(width: 4,),
                              Text(
                                  "DAIRY PRODUCTS",
                                  style:Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.white))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 10,),

                  Container(
                    //height: 30.0,
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey[300],
                            style: BorderStyle.solid,
                            width: 1.0,
                          ),
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.fiber_manual_record, color: Colors.grey,size: 10,),
                              SizedBox(width: 4,),
                              Text(
                                  "RESTURANT",
                                  style:Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.grey))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
            ),
             ),



              Row(
                children: [


                  Radio(value: 1, groupValue: 1, onChanged: (flag){},),
                  Text("Delivery",style: Theme.of(context).textTheme.bodyText2.copyWith(color:Theme.of(context).primaryColor,fontWeight: FontWeight.bold),),
                  SizedBox(width: 4,),
                  Radio(value: 2, groupValue: 1, onChanged: (flag){},),
                  InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> TakeAway()));
                      },
                      child: Text("Take Away",style: Theme.of(context).textTheme.bodyText2.copyWith(color:Colors.black,fontWeight: FontWeight.bold),)),
                ],
              ),

              Container(
                padding: EdgeInsets.only(top: 2,bottom: 8),
                decoration: BoxDecoration(
                  border: Border.symmetric(vertical: BorderSide.none)
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.only(top:2.0),
                        child: PageView(
                          scrollDirection: Axis.horizontal,
                          controller: _controller,
                          children: [
                            Image.asset('images/loginbg.jpg',fit: BoxFit.fill,),
                            Image.asset('images/dish.png'),
                            Image.asset('images/dish.png'),

                          ],
                          onPageChanged: (page){
                            setState(() {
                              currentPage=page;

                            });
                          },
                        ),
                      ),
                    ),


                    SizedBox(
                      height: 8,
                    ) ,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 7,
                          height: 7,
                          margin: EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                              color: currentPage==0?Theme.of(context).primaryColor: Colors.grey,
                              shape: BoxShape.circle
                          ),
                        ),
                        SizedBox(width: 4,),

                        Container(
                          width: 7,
                          height: 7,
                          margin: EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                              color: currentPage==1?Theme.of(context).primaryColor: Colors.grey,
                              shape: BoxShape.circle
                          ),
                        ),
                        SizedBox(width: 4,),

                        Container(
                          width: 7,
                          height: 7,
                          margin: EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                              color: currentPage==2?Theme.of(context).primaryColor: Colors.grey,
                              shape: BoxShape.circle
                          ),
                        ),
                      ],
                    ),


                    SizedBox(
                      height: 8,
                    ) ,



                  ],
                ),
              ) ,


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
                                    new BorderRadius.circular(4.0),
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
                                  style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.grey),
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



            ],
          ),

        ),
      ),
    );
  }
}
