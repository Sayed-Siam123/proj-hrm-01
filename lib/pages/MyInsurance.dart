import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_app/Bloc/leave_request_bloc.dart';
import 'package:hrm_app/ColorLibrary/HexColor.dart';
import 'package:hrm_app/helper/MainPage.dart';
import 'package:hrm_app/models/InsuranceSubmit_Model.dart';
import 'package:hrm_app/pages/MyLoan.dart';
import 'package:hrm_app/helper/DrawerWidget.dart';
import 'package:intl/intl.dart';
import 'package:responsive_grid/responsive_grid.dart';

import 'Home.dart';

class MyInsurancePage extends StatefulWidget {
  @override
  _MyInsurancePageState createState() => _MyInsurancePageState();
}

class _MyInsurancePageState extends State<MyInsurancePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Color back_profile = HexColor("#F2F2F2");
  String dropdownValue;

  DateTime selectedDateofExpire = DateTime.now();
  DateFormat formatter = DateFormat('dd-MM-yyyy');
  String formatted;
  TextEditingController expireDate = new TextEditingController();
  TextEditingController insuranefor = new TextEditingController();
  TextEditingController inPhoneNumber = new TextEditingController();
  TextEditingController inPolicyNumber = new TextEditingController();


  bool _validate1;

  String errortext1 = "*Date can\'t be empty";

  InsuranceSubmit data;

  _selectExpireDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDateofExpire, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDateofExpire)
      setState(() {
        selectedDateofExpire = picked;
      });
    formatted = formatter.format(selectedDateofExpire);
    print(formatted);
    expireDate.text = formatted;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainPage(currentIndex: 1,)),
        );
      },
      child: Scaffold(
        key: _scaffoldKey,
        drawer: DrawerWidget(scaffoldKey: _scaffoldKey,),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).backgroundColor,
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
            if(index.toString()=="0"){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage(currentIndex: 0,)),
              );
            }

            else if(index.toString()=="1"){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage(currentIndex: 1,)),
              );
            }

            else if(index.toString()=="2"){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage(currentIndex: 2,)),
              );
            }

          },
          iconSize: 25,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
          showUnselectedLabels: true,
          showSelectedLabels: true,
        ),
        body: Container(
          color: Theme.of(context).accentColor,
          child: CustomScrollView(slivers: <Widget>[
            SliverAppBar(
              floating: true,
              title: Text(
                "My Insurance",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Theme.of(context).buttonColor,
                        fontWeight: FontWeight.w500)),
              ),
              centerTitle: true,
              backgroundColor: Theme.of(context).accentColor,
              elevation: 0,
              leading: new IconButton(
                icon: new Icon(
                  Icons.menu,
                  color: Theme.of(context).buttonColor,
                ),
                onPressed: () => _scaffoldKey.currentState.openDrawer(),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
                    color: back_profile,
                    height: MediaQuery.of(context).size.height * 0.9,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: ResponsiveGridRow(
                        children:[
                          ResponsiveGridCol(
                            lg: 12,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    height: 55,
                                    width:
                                    MediaQuery.of(context).size.width,
                                    margin:
                                    EdgeInsets.fromLTRB(15, 35, 15, 0),
                                    padding:
                                    EdgeInsets.fromLTRB(15, 3, 5, 0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 5.0,
                                            spreadRadius: 5.0,
                                            offset: Offset(1, 1),
                                            color: Colors.grey.shade600
                                                .withOpacity(0.1)),
                                      ],
                                    ),
                                    child: TextField(
                                      controller: expireDate,
                                      enabled: true,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            Icons.calendar_today,
                                            color: Theme.of(context)
                                                .buttonColor
                                                .withOpacity(0.4),
                                          ),
                                          onPressed: () {
                                            _selectExpireDate(context);
                                            print("Expire");
                                          },
                                        ),
                                        hintText: "Date of expire",
                                        hintStyle: GoogleFonts.poppins(
                                          textStyle:
                                          TextStyle(fontSize: 16),
                                        ),
                                          contentPadding: _validate1 == false ? EdgeInsets
                                              .fromLTRB(0, 20, 0, 0) : EdgeInsets.fromLTRB(
                                              0, 15, 0, 0),
                                        errorText: _validate1 == false ? errortext1 : null,
                                      ),
                                    )),

                                InkWell(
                                  onTap: (){
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(builder: (context) => HomePage()),
                                    // );
                                  },
                                  child: Container(
                                    height: 55,
                                    width:
                                    MediaQuery.of(context).size.width,
                                    margin:
                                    EdgeInsets.fromLTRB(15, 100, 15, 0),
                                    padding:
                                    EdgeInsets.fromLTRB(15, 3, 5, 0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(),
                                      borderRadius:
                                      BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 5.0,
                                            spreadRadius: 5.0,
                                            offset: Offset(1, 1),
                                            color: Colors.grey.shade600
                                                .withOpacity(0.1)),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text("UPLOAD DOCUMENTS",
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),

                                  ),
                                ),


                                Builder(
                                  builder: (context) => InkWell(
                                    onTap: (){
                                      if (expireDate.text.isEmpty && expireDate.text == "") {
                                        print("KHali");
                                        setState(() {
                                          _validate1 = false;
                                        });

                                        //TODO:: Toast hobe ekta
                                      } else {
                                        _validate1 = true;
                                      }
                                      print("Vora");

                                      data = InsuranceSubmit(
                                        expireDate: expireDate.text.toString()
                                      );



                                      Timer(Duration(milliseconds: 50), () {
                                        Scaffold.of(context).showSnackBar(SnackBar(
                                          content: Text(
                                            'Applied Successfully',
                                            style: GoogleFonts.exo2(
                                              textStyle: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          duration: Duration(seconds: 2),
                                        ));
                                      });

                                      Timer(Duration(seconds: 2), () {
                                        print(expireDate.text.toString() + "," +
                                            expireDate.toString());

                                        leaverequestbloc.CreateInsurancePost(data);
                                        leaverequestbloc.dispose();

                                        expireDate.text = "";

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => MainPage(currentIndex: 1,)),
                                        );

                                      });

                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(builder: (context) => HomePage()),
                                      // );
                                    },
                                    child: Container(
                                      height: 55,
                                      width:
                                      MediaQuery.of(context).size.width,
                                      margin:
                                      EdgeInsets.fromLTRB(15, 20, 15, 0),
                                      padding:
                                      EdgeInsets.fromLTRB(15, 3, 5, 0),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).buttonColor,
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 5.0,
                                              spreadRadius: 5.0,
                                              offset: Offset(1, 1),
                                              color: Colors.grey.shade600
                                                  .withOpacity(0.1)),
                                        ],
                                      ),
                                      child: Center(
                                        child: Text("SAVE",
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),

                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    height: MediaQuery.of(context).size.width * 0.13,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          GestureDetector(
                            child: Padding(
                              padding: EdgeInsets.only(top:3.0,right: 3),
                              child: Text("My Loan",style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400
                                )
                              ),),
                            ),
                            onTap: (){
                              print("Tapped1");
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MyLoanPage()),
                              );
                            },
                          ),

                          Center(
                            child: Container(
                              height: 40,
                              width: 40,
                              color: Colors.transparent,
                              child: IconButton(
                                onPressed: (){
                                  print("Tapped2");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => MyLoanPage()),
                                  );
                                },
                                icon: Icon(Icons.arrow_forward),
                                color: Theme.of(context).buttonColor,
                              ),

                            ),
                          ),
                        ],
                      )
                    ),
                  ),
                ],
              ),
            ])),
          ]),
        ),
      ),
    );
  }
}
