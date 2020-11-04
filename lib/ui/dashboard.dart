import 'package:cloud_kitchen/ui/home/HomeScreen.dart';
import 'package:cloud_kitchen/ui/cart.dart';
import 'package:cloud_kitchen/ui/profile.dart';
import 'package:cloud_kitchen/ui/tackaway.dart';
import 'package:cloud_kitchen/viewmodel/franchisi/frviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

AllFrenchisiViewModel allFrenchisiViewModel=AllFrenchisiViewModel();
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  int currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  final scaffoldState = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    // TODO: implement initState
   allFrenchisiViewModel.getAllFranchise();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldState,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
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
                icon:new Stack(
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
                // new Icon(Icons.local_grocery_store,color: Colors.black,),
                label: 'CART',
                activeIcon: Icon(Icons.local_grocery_store, color: Theme.of(context).primaryColor,)
            ),

            BottomNavigationBarItem(
                icon: new Icon(Icons.person,color: Colors.black),
                label: 'PROFILES',
                activeIcon: Icon(Icons.person, color: Theme.of(context).primaryColor,)
            ),

            //  BottomNavigationBarItem(
            //    icon: Icon(Icons.send),
            //    title: Text('SETTING')
            //  ),
          ],
        ),
        body: _children(currentIndex),
      ),

    );
  }


  Widget _children(int index) {
    if (index == 0 ) {
       return HomeScreen(allFrenchisiViewModel);
    }  else if (index == 2) {
      return ProfileScreen();
    } else if (index == 1) {
      return Cart(allFrenchisiViewModel);
    }
  }

}
