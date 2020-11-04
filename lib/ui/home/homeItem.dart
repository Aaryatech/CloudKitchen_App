import 'package:cloud_kitchen/network/model/response/ItemData.dart';
import 'package:cloud_kitchen/ui/menudetailspage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// class HomeItem extends StatefulWidget {
//   final ItemData itemData;
//
//   const HomeItem({this.itemData});
//
//   @override
//   _HomeItemState createState() => _HomeItemState();
// }
//
// class _HomeItemState extends State<HomeItem> {
//   @override
//   Widget build(BuildContext context) {
//     return   InkWell(
//       onTap: (){
//         Navigator.push(context, MaterialPageRoute(builder: (context)=> MenuDetails()));
//       },
//       child: Container(
//         child: Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment:  CrossAxisAlignment.center,
//             children: <Widget>[
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   Stack(
//                     children: <Widget>[
//                       Container(
//                         width: 100,
//                         height: 100,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                               image: AssetImage('images/loginbg.jpg'),
//                               fit: BoxFit.cover),
//                           borderRadius:
//                           new BorderRadius.circular(4.0),
//                         ),
//                       ),
//
//                       Container(
//                         alignment: Alignment.topLeft,
//                         //padding: EdgeInsets.all(10),
//                         margin: const EdgeInsets.all(8),
//                         height: 20,
//                         // width: 80,
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: <Widget>[
//                             Image.asset(
//                               "images/veg_icn.png",
//                               height: 10,
//                               width: 10,
//                             ),
//                           ],
//                         ),
//                       ),
//
//
//                     ],
//                   ),
//                 ],
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: 10.0, vertical: 10.0),
//                 child: new Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//
//                     Text(
//                       widget.itemData.itemName,
//                       style: Theme.of(context).textTheme.subtitle1,
//                       textAlign: TextAlign.start,
//                     ),
//                     SizedBox(
//                       height: 4,
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width*.45,
//                       child: Text(
//                         widget.itemData.itemDesc,
//                         style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.grey),
//                         textAlign: TextAlign.start,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//
//
//                     GestureDetector(
//                       onTap: () {
//                         // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Theme.of(context).primaryColor,
//                           borderRadius: BorderRadius.circular(4.0),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(2.0),
//                           child: Text(
//                               widget.itemData.tasteName,
//                               style:Theme.of(context).textTheme.caption.copyWith(color:Colors.white,fontSize: 10)),
//                         ),
//                       ),
//                     ),
//
//
//                     new Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//
//                         Icon(Icons.star, color:widget.itemData.rating>=1?Colors.yellow:Colors.grey,size: 12,),
//
//                         SizedBox(
//                           width: 4,
//                         ),
//
//                         Icon(Icons.star, color: widget.itemData.rating>=2?Colors.yellow:Colors.grey,size: 12,),
//
//                         SizedBox(
//                           width: 4,
//                         ),
//
//                         Icon(Icons.star, color: widget.itemData.rating>=3?Colors.yellow:Colors.grey,size: 12,),
//                         SizedBox(
//                           width: 4,
//                         ),
//
//                         Icon(Icons.star, color: widget.itemData.rating>=4?Colors.yellow:Colors.grey,size: 12,),
//
//                         SizedBox(
//                           width: 4,
//                         ),
//
//                         Icon(Icons.star, color: widget.itemData.rating>=5?Colors.yellow:Colors.grey,size: 12,),
//
//                       ],
//                     ),
//
//                     Row(
//                       children: [
//                         Image.asset('images/rupees_icn.png',width: 16,height: 16,),
//                         Text('${widget.itemData.spRateAmt}'),
//                       ],
//                     ),
//
//                   ],
//                 ),
//               ),
//
//               Container(
//                   padding: EdgeInsets.all(4),
//                   decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey),
//                     borderRadius:
//                     new BorderRadius.circular(8.0),
//                   ),
//
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Image.asset('images/plus_icon.png',width: 16,height: 16,color: Colors.black,),
//                       SizedBox(width: 4,),
//
//                       Text("1",style: Theme.of(context).textTheme.subtitle2.copyWith(color: Theme.of(context).primaryColor),),
//                       SizedBox(width: 4,),
//
//                       Image.asset('images/minus_icn.png',width: 16,height: 16,color: Colors.black,),
//                     ],
//                   )
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
