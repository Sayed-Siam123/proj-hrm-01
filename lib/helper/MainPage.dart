import 'package:flutter/material.dart';
import 'package:hrm_app/helper/DrawerWidget.dart';
import 'package:hrm_app/pages/Home.dart';
import 'package:hrm_app/pages/Profile.dart';
import 'package:hrm_app/pages/Request.dart';

class MainPage extends StatefulWidget {

  int currentIndex;

  MainPage({this.currentIndex});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _children = [
    HomePage(),
    RequestPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: _children[widget.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).backgroundColor,
        currentIndex: widget.currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.storage),
            title: Text("Request"),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text("Profile"),
          ),
        ],
        onTap: (index){
          setState(() {
            widget.currentIndex = index;
          });
          print(widget.currentIndex.toString());

        },
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).buttonColor,
        iconSize: 25,
        showUnselectedLabels: true,
        showSelectedLabels: true,
      ),
    );
  }
}
