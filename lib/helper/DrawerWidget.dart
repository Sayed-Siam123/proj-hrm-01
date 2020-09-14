import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_app/Bloc/user_bloc.dart';
import 'package:hrm_app/helper/MainPage.dart';
import 'package:hrm_app/pages/Home.dart';
import 'package:hrm_app/pages/LeaveRequest.dart';
import 'package:hrm_app/pages/Login.dart';
import 'package:hrm_app/pages/MyInsurance.dart';
import 'package:hrm_app/pages/MyVisa.dart';
import 'package:hrm_app/pages/Profile.dart';
import 'package:hrm_app/pages/Request.dart';
import 'package:hrm_app/pages/Resignation.dart';
import 'package:hrm_app/resources/SharedPrefer.dart';

class DrawerWidget extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const DrawerWidget({Key key, this.scaffoldKey}) : super(key: key);
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {

  String loginKey = "loginKey";
  String useridKey = "userid";
  String loginName = "loginName";
  String userDesignation = "userDesignation";
  String PresentStatus = "PresentStatus";
  String LateStatus = "LateStatus";
  String Intimes = "Intimes";
  String MonthPresent = "MonthPresent";
  String MonthAbesnt = "MonthAbesnt";
  String MonthLeave = "MonthLeave";
  String MonthLate = "MonthLate";

  SessionManager prefs = SessionManager();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('HR',style: GoogleFonts.poppins(
              fontSize: 20,
            ),),
            decoration: BoxDecoration(
              color: Colors.amberAccent,
            ),
          ),


          ListTile(
            title: Text('Home',style: GoogleFonts.exo2(
              textStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),),
            trailing:  new Icon(Icons.arrow_forward),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage(currentIndex: 0,)),
              );
            },
          ),

          ListTile(
            title: Text('Leave Request',style: GoogleFonts.exo2(
              textStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),),
            trailing:  new Icon(Icons.arrow_forward),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LeaveRequestPage()),
              );
            },
          ),

          ListTile(
            title: Text('My Insurance',style: GoogleFonts.exo2(
              textStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),),
            trailing:  new Icon(Icons.arrow_forward),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyInsurancePage()),
              );
            },
          ),

          ListTile(
            title: Text('Resignation',style: GoogleFonts.exo2(
              textStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),),
            trailing:  new Icon(Icons.arrow_forward),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResignationPage()),
              );
            },
          ),

          ListTile(
            title: Text('My Visa',style: GoogleFonts.exo2(
              textStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),),
            trailing:  new Icon(Icons.arrow_forward),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyVisaPage()),
              );
            },
          ),

          ListTile(
            title: Text('Logout',style: GoogleFonts.exo2(
              textStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),),
            trailing:  new Icon(Icons.arrow_forward),
            onTap: () {
              // Update the state of the app.
              // ...
              logout();

              Timer(Duration(seconds: 2), () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage(status: false,)),
                );
              });

            },
          ),
        ],
      ),
    );
  }

  void logout() async {
    userbloc.dispose();
    prefs.setData(loginKey,null);
    prefs.setData(loginName,null);
    prefs.setData(userDesignation,null);
    prefs.setData(PresentStatus,null);
    prefs.setData(LateStatus,null);
    prefs.setData(Intimes,null);
    prefs.setData(MonthPresent,null);
    prefs.setData(MonthAbesnt,null);
    prefs.setData(MonthLeave,null);
    prefs.setData(MonthLate,null);

    print("LOgged out");

  }


}
