import 'package:cloud_kitchen/ui/home/HomeScreen.dart';
import 'package:cloud_kitchen/ui/cart/cart.dart';
import 'package:cloud_kitchen/ui/user/profile.dart';
import 'package:cloud_kitchen/viewmodel/franchisi/frviewmodel.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:native_updater/native_updater.dart';

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


  @override
  void initState() {
    // TODO: implement initState
    allFrenchisiViewModel.getAllFranchise();
    // checkVersion();

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage message) {
      if (message != null) {
        print(message.data.toString());
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                '1',
                'channel.name',
                'channel.description',
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: 'launch_background',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      //   Navigator.pushNamed(context, '/message',
      //       arguments: MessageArguments(message, true));
      // });
    });


    super.initState();
  }



  // Future<void> checkVersion() async {
  //   /// For example: You got status code of 412 from the
  //   /// response of HTTP request.
  //   /// Let's say the statusCode 412 requires you to force update
  //   int statusCode = 412;
  //
  //   /// This could be kept in our local
  //   int localVersion = 9;
  //
  //   /// This could get from the API
  //   int serverLatestVersion = 10;
  //
  //   Future.delayed(Duration.zero, () {
  //     if (statusCode == 412) {
  //       NativeUpdater.displayUpdateAlert(
  //         context,
  //         forceUpdate: true,
  //         playStoreUrl: 'https://play.google.com/store/apps/details?id=com.madhvi.cloudkitchen',
  //
  //         iOSUpdateButtonLabel: 'Upgrade',
  //         iOSCloseButtonLabel: 'Exit',
  //       );
  //     } else if (serverLatestVersion > localVersion) {
  //       NativeUpdater.displayUpdateAlert(
  //         context,
  //         forceUpdate: false,
  //         playStoreUrl: 'https://play.google.com/store/apps/details?id=com.madhvi.cloudkitchen',
  //
  //       );
  //     }
  //   });
  // }



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
