import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_app/ColorLibrary/HexColor.dart';
import 'package:hrm_app/pages/LeaveRequest.dart';
import 'package:hrm_app/helper/DrawerWidget.dart';
import 'package:hrm_app/widget/ProfileWidget/FamilyInsuranceTabWidget.dart';
import 'package:hrm_app/widget/ProfileWidget/InsuranceTabWidget.dart';
import 'package:hrm_app/widget/ProfileWidget/LoanTabWidget.dart';
import 'package:hrm_app/widget/ProfileWidget/MyEmployeesTabWidget.dart';
import 'package:hrm_app/widget/ProfileWidget/SalaryTabWidget.dart';
import 'package:hrm_app/widget/ProfileWidget/VisaTabWidget.dart';
import 'package:logger/logger.dart';
import 'package:responsive_grid/responsive_grid.dart';

class ProfilePage extends StatefulWidget {

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {

  final GlobalKey<ScaffoldState> _scaffoldKey_Profile = new GlobalKey<ScaffoldState>();

  TabController _tabController;
  var logger = Logger(); //logger object initiate

  Color back_profile = HexColor("#F2F2F2");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey_Profile,
      drawer: DrawerWidget(scaffoldKey: _scaffoldKey_Profile,),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              backgroundColor: Theme.of(context).backgroundColor,
              elevation: 0,
              leading: new IconButton(
                icon: new Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () => _scaffoldKey_Profile.currentState.openDrawer(),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 195, 0, 0),
                      color: back_profile,
                      height:
                      MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width,
                      child: ResponsiveGridRow(
                        children: [
                          ResponsiveGridCol(
                            lg: 12,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  height: 60,
                                  width: MediaQuery.of(context).size.width,
                                  child: Container(
                                    alignment: Alignment.topCenter,
                                    color: Colors.white,
                                    child: TabBar(
                                      indicatorWeight: 6,
                                      labelStyle: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14),
                                      unselectedLabelColor: Colors.black87,
                                      labelColor: Colors.black87,
                                      labelPadding:
                                          EdgeInsets.fromLTRB(20, 0, 20, 0),
                                      isScrollable: true,
                                      tabs: [
                                        new Tab(text: "Salary"),
                                        new Tab(text: "Insurance"),
                                        new Tab(text: "Family Insurance"),
                                        new Tab(text: "Loan"),
                                        new Tab(text: "Visa"),
                                        new Tab(text: "My Employees"),
                                      ],
                                      controller: _tabController,
                                      indicatorColor:
                                          Theme.of(context).buttonColor,
                                      indicatorSize: TabBarIndicatorSize.tab,
                                    ),
                                  ),
                                ),
                                Container(
                                  height:
                                  MediaQuery.of(context).size.height * 0.52,
                                  width: MediaQuery.of(context).size.width,
                                  child: TabBarView(
                                    controller: _tabController,
                                    children: [
                                      new SalaryTabWidget(),
                                      new InsuranceTabWidget(),
                                      new FamilyInsuranceTabWidget(),
                                      new LoanTabWidget(),
                                      new VisaTabWidget(),
                                      new MyEmployeesTabWidget(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      color: Theme.of(context).backgroundColor,
                      height: 190,
                      width: MediaQuery.of(context).size.width,
                      child: ResponsiveGridRow(
                        children: [
                          ResponsiveGridCol(
                            lg: 12,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(left: 85),
                                  width: 300,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                          height: 120,
                                          width: 120,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: CircleAvatar(
                                            child: ClipOval(
                                              child: Image.asset(
                                                "assets/images/profile.jpg",
                                                width: 120,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          )),
                                      SizedBox(
                                        width: 40,
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            print("Tapped here");
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            color: Theme.of(context).buttonColor,
                                          ))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "User",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 0,
                                ),
                                Text(
                                  "Sr. Accountant",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Theme.of(context).buttonColor,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
