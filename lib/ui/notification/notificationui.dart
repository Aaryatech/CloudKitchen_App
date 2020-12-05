import 'package:cloud_kitchen/local/staticUrls.dart';
import 'package:cloud_kitchen/network/model/response/notifications/notifications.dart';
import 'package:cloud_kitchen/viewmodel/franchisi/frviewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class NotificationsUi extends StatefulWidget {
  final AllFrenchisiViewModel allFrenchisiViewModel;

  const NotificationsUi( this.allFrenchisiViewModel);
  @override
  _NotificationsUiState createState() => _NotificationsUiState();
}

class _NotificationsUiState extends State<NotificationsUi> {


  @override
  void initState() {
    // TODO: implement initState
    widget.allFrenchisiViewModel.getAllNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Observer(
      builder:(_)=> Scaffold(
   appBar: AppBar(
      elevation: 0,
      title: Text("Notifications",style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white,)),
      ),
      body:widget.allFrenchisiViewModel.isLoading?LinearProgressIndicator():
      Container(
        padding: EdgeInsets.only(left: 16,right: 16),
        child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Colors.black54,
            ),
            itemCount: widget.allFrenchisiViewModel.notifications.notification.length,
            itemBuilder:(context,index){
            Notifications noti=widget.allFrenchisiViewModel.notifications.notification[index];
            return ListTile(
              title: Text(noti.title,style: Theme.of(context).textTheme.subtitle2,),
              dense: true,
              leading:noti.image.isNotEmpty?Container(
                width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              image: DecorationImage(image: NetworkImage('${imageUrl}${noti.image}'),
              fit: BoxFit.cover))): Image.asset('images/ic_launcher.png'),
              subtitle: Text(noti.description,style: Theme.of(context).textTheme.caption.copyWith(color: Colors.grey),),
            ); }),
      )

      ),
    ));
  }
}



