import 'package:cloud_kitchen/ui/home/HomeScreen.dart';
import 'package:cloud_kitchen/ui/cart/cart.dart';
import 'package:cloud_kitchen/ui/user/profile.dart';
import 'package:cloud_kitchen/ui/tackaway.dart';
import 'package:cloud_kitchen/viewmodel/franchisi/frviewmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

AllFrenchisiViewModel allFrenchisiViewModel=AllFrenchisiViewModel();
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  void _showError(dynamic exception) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(exception.toString())));
  }
  void onTabTapped(int index) {
    setState(() {
      allFrenchisiViewModel.currentIndex  = index;
    });
  }
  final scaffoldState = GlobalKey<ScaffoldState>();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();



   initNotification()async{

     AndroidNotificationChannel channel = AndroidNotificationChannel(
       'high_importance_channel', // id
       'High Importance Notifications', // title
       'This channel is used for important notifications.', // description
       importance: Importance.max,
     );


     await flutterLocalNotificationsPlugin
         .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
         ?.createNotificationChannel(channel);


     AndroidInitializationSettings initializationSettingsAndroid =
     AndroidInitializationSettings('app_icon');

     final InitializationSettings initializationSettings = InitializationSettings(
         android: initializationSettingsAndroid);
     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
         onSelectNotification: selectNotification);



   }


  Future selectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
    // await Navigator.push(
    //   context,
    //   MaterialPageRoute<void>(builder: (context) => SecondScreen(payload)),
    // );
  }

  @override
  void initState() {
    // TODO: implement initState
   allFrenchisiViewModel.getAllFranchise();

   FirebaseMessaging.onMessage.listen((RemoteMessage message) {

     print(message.toString());


     // If `onMessage` is triggered with a notification, construct our own
     // local notification to show to users using the created channel.
     showNotification(message.data);

   });

    super.initState();
  }


  showNotification(Map<String,String> data)async{
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        showWhen: false);
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, data['title'], data['body'], platformChannelSpecifics,
        payload: 'item x');
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldState,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex:allFrenchisiViewModel.currentIndex,
          onTap:onTabTapped,
          selectedLabelStyle: TextStyle(fontSize: 10),
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          unselectedLabelStyle: TextStyle(color: Colors.black),
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.black,
          // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
                icon: new Icon(Icons.home,color: Colors.black),
                label: 'HOME',
                activeIcon: Icon(Icons.home, color: Theme.of(context).primaryColor,)
            ),
            BottomNavigationBarItem(
                icon:Observer(
                  builder:(_)=> new Stack(
                    children: <Widget>[
                      new Icon(Icons.local_grocery_store,color: Colors.black,),
                      new Positioned(
                        right: 0,
                        child: new Container(
                          padding: EdgeInsets.all(1),
                          decoration: new BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 12,
                            minHeight: 12,
                          ),
                          child: Observer(
                            builder: (_) =>  Text(
                             '${allFrenchisiViewModel.items.length??0}',
                              style: new TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.w700
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // new Icon(Icons.local_grocery_store,color: Colors.black,),
                label: 'CART',
                activeIcon: Icon(Icons.local_grocery_store, color: Theme.of(context).primaryColor,)
            ),

            BottomNavigationBarItem(
                icon: new Icon(Icons.person,color: Colors.black),
                label: 'PROFILE',
                activeIcon: Icon(Icons.person, color: Theme.of(context).primaryColor,)
            ),

            //  BottomNavigationBarItem(
            //    icon: Icon(Icons.send),
            //    title: Text('SETTING')
            //  ),
          ],
        ),
        body: Observer(
          builder:(_)=> WillPopScope(
              onWillPop: (){
                if(allFrenchisiViewModel.currentIndex!=0){
                  setState(() {
                    allFrenchisiViewModel.currentIndex=0;
                  });
                }
                return;
              },

              child: Observer(
                  builder:(_)=> _children(allFrenchisiViewModel.currentIndex))),
        ),
      ),

    );
  }


  Widget _children(int index) {
    if (index == 0 ) {
       return HomeScreen(allFrenchisiViewModel);
    }  else if (index == 2) {
      return ProfileScreen(allFrenchisiViewModel);
    } else if (index == 1) {
      return Cart(allFrenchisiViewModel);
    }
  }

}
