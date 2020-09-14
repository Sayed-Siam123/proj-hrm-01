import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_app/ColorLibrary/HexColor.dart';
import 'package:hrm_app/helper/DrawerWidget.dart';
import 'package:hrm_app/helper/MainPage.dart';
import 'package:hrm_app/pages/Request.dart';
import 'package:hrm_app/widget/LeaveRequestWidget/LeaveTextBoxPart.dart';
import 'package:hrm_app/widget/LeaveRequestWidget/LeaveTopPart.dart';
import 'package:intl/intl.dart';
import 'package:responsive_grid/responsive_grid.dart';

class LeaveRequestPage extends StatefulWidget {
  @override
  _LeaveRequestPageState createState() => _LeaveRequestPageState();
}

class _LeaveRequestPageState extends State<LeaveRequestPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Color back_profile = HexColor("#F2F2F2");


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
          color: Theme.of(context).backgroundColor,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Theme.of(context).backgroundColor,
                elevation: 0,
                leading: new IconButton(
                  icon: new Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () => _scaffoldKey.currentState.openDrawer(),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 250, 0, 0),
                        color: back_profile,
                        height: MediaQuery.of(context).size.height * 0.73,
                        width: MediaQuery.of(context).size.width,
                        child: ResponsiveGridRow(
                          children: [
                            ResponsiveGridCol(
                              lg: 12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[],
                              ),
                            )
                          ],
                        ),
                      ),
                      LeaveTopPart(),
                      LeaveTextBoxPart(),
                    ],
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
