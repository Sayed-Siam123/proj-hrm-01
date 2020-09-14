import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeTopWidget extends StatefulWidget {
  @override
  _HomeTopWidgetState createState() => _HomeTopWidgetState();
}


class _HomeTopWidgetState extends State<HomeTopWidget> {

  DateTime selectedDateofExpire = DateTime.now();
  DateFormat formatter = DateFormat('d MMM, yyyy');
  String formatted;

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

  getCurrentDate() {
    DateTime date = new DateTime.now();

    setState(() {
      formatted = formatter.format(date);
    });

    print(formatted.toString());
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 50), () {
      getCurrentDate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 19, 0, 0),
      height: MediaQuery.of(context).size.height*0.32,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        //color: Colors.green,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(190),bottomRight: Radius.circular(190)),
        shape: BoxShape.rectangle,
      ),
      //color: Colors.red,
      child: ResponsiveGridRow(
        children: [
          ResponsiveGridCol(
            lg: 12,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20,0,0,0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Hello,",style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                            ),
                          ),),
                          FutureBuilder(
                            future: getShared(loginName),
                            initialData: false,
                            builder: (context, snapshot) {
                              return Text(snapshot.data==null ? "User":snapshot.data.toString(),style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 25,
                                ),
                              ),);
                            },
                          ),
                        ],
                      ),

                      Padding(
                        padding: EdgeInsets.only(right:50.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(formatted.toString(),style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w500
                            ),),
                            FutureBuilder(
                              future: getShared(PresentStatus),
                              initialData: false,
                              builder: (context, snapshot) {
                                return Text(snapshot.data.toString(),style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500
                                ),);
                              },
                            ),
                            FutureBuilder(
                              future: getShared(Intimes),
                              initialData: false,
                              builder: (context, snapshot) => Text(snapshot.data.toString(),style: GoogleFonts.poppins(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500
                              ),),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 20,),
                  Center(
                    child: Container(
                      height: 90,
                      width: 340,
                      child: Padding(
                        padding: EdgeInsets.only(top: 2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text("PRESENT",style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),),
                                SizedBox(height: 2,),
                                FutureBuilder(
                                  future: getShared(MonthPresent),
                                  initialData: false,
                                  builder: (context, snapshot) => Text(snapshot.data.toString()+" days",style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11,
                                    ),
                                  ),),
                                ),
                              ],
                            ),

                            Column(
                              children: <Widget>[
                                Text("ABSENT",style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),),
                                SizedBox(height: 2,),


                                FutureBuilder(
                                  future: getShared(MonthAbesnt),
                                  initialData: false,
                                  builder: (context, snapshot) => Text(snapshot.data.toString()+" days",style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11,
                                    ),
                                  ),),
                                ),
                              ],
                            ),

                            Column(
                              children: <Widget>[
                                Text("LATE",style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),),
                                SizedBox(height: 2,),
                                FutureBuilder(
                                  future: getShared(MonthLate),
                                  initialData: false,
                                  builder: (context, snapshot) => Text(snapshot.data.toString()+" days",style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11,
                                    ),
                                  ),),
                                ),
                              ],
                            ),

                            Column(
                              children: <Widget>[
                                Text("LEAVE",style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),),
                                SizedBox(height: 2,),

                                FutureBuilder(
                                  future: getShared(MonthLeave),
                                  initialData: false,
                                  builder: (context, snapshot) => Text(snapshot.data.toString()+" days",style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11,
                                    ),
                                  ),),
                                ),
                              ],
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
        ],
      ),
    );
  }

  void putShared(String key, String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, val);
  }

  Future getShared(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String val = prefs.getString(key);
    return val;
  }

  Future deleteShared(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
