import 'package:cloud_kitchen/ui/OTPScreen.dart';
import 'package:flutter/material.dart';

class SliderView extends StatefulWidget {
  @override
  _SliderViewState createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {

PageController _controller = PageController(
    initialPage: 0,
    
  );
int currentPage=0;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                 children: [




                         // child: PageView(
                              PageView(
          controller: _controller,
           scrollDirection: Axis.horizontal,
          children: [
                MyPage1Widget(),
                        MyPage2Widget(),
                        MyPage3Widget(),
                      ],
                      onPageChanged: (page){
                      setState(() {
                        currentPage=page;
                        print(currentPage);
                      });
                    },
                    ),

                   Padding(
                     padding: EdgeInsets.all(16),
                     child:currentPage==0?
                     Align(
                         alignment: Alignment.topRight,
                         child: InkWell(
                           onTap:(){
                             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> OTPScreen()));
                           } ,
                           child: Text( 'Skip',style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.grey)),

                         ),)
                         :
                       Row(
                         mainAxisSize: MainAxisSize.max,
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                            Icon(Icons.keyboard_arrow_left),
                           InkWell(
                             onTap:(){
                               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> OTPScreen()));
                             } ,
                             child: Text( 'Skip',style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.grey)),

                           ),
                         ],
                       ),
                   ),

                      Positioned(
                        bottom: 48.0,
                       left: 10.0,
                       right: 10.0,
                                          child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                           Row(
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


   RaisedButton(onPressed: (){
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=> MyPage2Widget()));


     if(currentPage<2) {
       _controller.nextPage(duration: Duration(milliseconds: 300),
           curve: Curves.fastLinearToSlowEaseIn);
     }else{
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> OTPScreen()));
     }
   },
                              shape: CircleBorder(

                              ),
                              padding: EdgeInsets.all(20.0),
                              color: Theme.of(context).primaryColor,
                              textColor: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(currentPage<2?'Next':"Submit",style:Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.white)),
                              ),
                            )
                    ],
                  ),
                      ),
                 ],
              ),
            ),
      ),
    );
          }
        }
        
      class MyPage1Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
          margin:EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
             


 SizedBox(
                    height: 30,
                  ),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text( 'Order Your Food', style:Theme.of(context).textTheme.headline5.copyWith(color:Colors.black,fontWeight: FontWeight.w700)),
                  SizedBox(
                    height: 10,
                  ),
                  Text( 'Now you an order food any time', style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.grey)),
                  Text( 'right from your mobile', style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                   
                   Image.asset(
              "images/intro_1.png",
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*.50,
                        ),
                  ],
                  ),

            ],
          ),
        ),
      ),
    );
  }
}

class MyPage2Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,

              margin:EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                  Image.asset(
              "images/intro-2.png",
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*.50,

                  ),

          
                  Text( 'Cooking Safe Food',  style:Theme.of(context).textTheme.headline5.copyWith(color:Colors.black,fontWeight: FontWeight.w700)),
                  SizedBox(
                    height: 10,
                  ),
                  Text( 'We are maintain safty and we keep',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.grey)),
                  Text( 'clean while making food', style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.grey)),
                
                  
                  ],
                  ),
  //           Expanded(
  //             flex: 1,
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                  Text( 'Skip', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 15,),textAlign: TextAlign.start,),

                    

  //  RaisedButton(onPressed: (){
  //                     Navigator.push(context, MaterialPageRoute(builder: (context)=> MyPage3Widget()));
  //                   },
  //                     shape: CircleBorder(),
  //                     padding: EdgeInsets.all(20.0),
  //                     color: const Color(0xffff5959),
  //                     textColor: Colors.white,
  //                     child: Text('Next',style: TextStyle(
  //                         fontSize: 18.0,
  //                         color: Colors.white
  //                     ),),
  //                   )
  //               ],
  //             ),
  //           ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyPage3Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
          margin:EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[


                 SizedBox(
                    height: 40,
                  ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text( 'Quick Delivery', style:Theme.of(context).textTheme.headline5.copyWith(color:Colors.black,fontWeight: FontWeight.w700)),
                  SizedBox(
                    height: 10,
                  ),
                  Text( 'Order yourfavorite meals will', style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.grey)),
                  Text( 'be immediately deliver',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.grey)),

                   Image.asset(
              "images/intro-3.png", 
             height: MediaQuery.of(context).size.height*0.5,
             width: MediaQuery.of(context).size.width,

                     ),
                  ],
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

