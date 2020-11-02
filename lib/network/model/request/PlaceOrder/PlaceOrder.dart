
import 'package:cloud_kitchen/network/model/request/PlaceOrder/OrderDetailList.dart';
import 'package:cloud_kitchen/network/model/request/PlaceOrder/OrderHeader.dart';
import 'package:cloud_kitchen/network/model/request/PlaceOrder/OrderTrail.dart';

class PlaceOrder{

   OrderHeader orderHeader;
  List<OrderDetailList> orderDetailList;
  OrderTrail orderTrail;

  PlaceOrder({this.orderHeader, this.orderDetailList, this.orderTrail});

}