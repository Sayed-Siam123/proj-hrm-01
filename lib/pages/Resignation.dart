import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_app/ColorLibrary/HexColor.dart';
import 'package:hrm_app/helper/MainPage.dart';
import 'package:hrm_app/pages/MyInsurance.dart';
import 'package:hrm_app/helper/DrawerWidget.dart';
import 'package:intl/intl.dart';
import 'package:responsive_grid/responsive_grid.dart';

import 'Home.dart';

class ResignationPage extends StatefulWidget {
  @override
  _ResignationPageState createState() => _ResignationPageState();
}

class _ResignationPageState extends State<ResignationPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Color back_profile = HexColor("#F2F2F2");
  String dropdownValue;

  bool checkStatus = false;

  DateTime apply_date = DateTime.now();
  DateFormat formatter = DateFormat('dd-MM-yyyy');
  String formatted;
  TextEditingController applyDate = new TextEditingController();
  TextEditingController loan_amount = new TextEditingController();
  TextEditingController inPhoneNumber = new TextEditingController();
  TextEditingController inPolicyNumber = new TextEditingController();
  TextEditingController starting_month = new TextEditingController();
  TextEditingController starting_year = new TextEditingController();




  _selectExpireDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: apply_date, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != apply_date)
      setState(() {
        apply_date = picked;
      });
    formatted = formatter.format(apply_date);
    print(formatted);
    applyDate.text = formatted;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return Navigator.push(
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
                "Resignation",
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
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
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
                                    margin: EdgeInsets.fromLTRB(15, 40, 15, 0),
                                    padding: EdgeInsets.fromLTRB(15, 4, 15, 0),
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
                                      controller: applyDate,
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
                                            print("apply");
                                          },
                                        ),
                                        hintText: "Date to apply",
                                        hintStyle: GoogleFonts.poppins(
                                          textStyle:
                                          TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    )),

                                Container(
                                    height: 55,
                                    width:
                                    MediaQuery.of(context).size.width,
                                    margin:
                                    EdgeInsets.fromLTRB(15, 15, 15, 0),
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
                                      controller: loan_amount,
                                      enabled: true,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        hintText: "Notes*",
                                        hintStyle: GoogleFonts.poppins(
                                          textStyle:
                                          TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    )),


                                Container(
                                  margin:
                                  EdgeInsets.fromLTRB(5, 15, 15, 0),
                                  child: CheckboxListTile(
                                    title: Text("I accept the terms and condition of Resignation",style: GoogleFonts.poppins(
                                      color: Theme.of(context).buttonColor,
                                    ),),
                                    activeColor: Theme.of(context).buttonColor,
                                    value: checkStatus,
                                    onChanged: (newValue) {
                                      setState(() {
                                        checkStatus = newValue;
                                      });
                                      print(newValue.toString());
                                    },
                                    controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                                  ),
                                ),


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
                                    EdgeInsets.fromLTRB(15, 130, 15, 0),
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
                                      child: Text("APPLY",
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
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    height: MediaQuery.of(context).size.width * 0.05,
                    width: MediaQuery.of(context).size.width,
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
