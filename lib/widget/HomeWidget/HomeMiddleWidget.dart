import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_app/Bloc/home_bloc.dart';
import 'package:hrm_app/models/Notification_Model.dart';
import 'package:responsive_grid/responsive_grid.dart';

import 'EventsTab.dart';
import 'MeetingTab.dart';
import 'NotificationTab.dart';
import 'ViewAllTab.dart';

class HomeMiddleWidget extends StatefulWidget {
  @override
  _HomeMiddleWidgetState createState() => _HomeMiddleWidgetState();
}

class _HomeMiddleWidgetState extends State<HomeMiddleWidget>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Notification_Model> fetcheddata = [];
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  bool status = false;

  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 4, vsync: this);
    homebloc.fetchAllNotificationdata();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 70),
      height: MediaQuery.of(context).size.height * .85,
      width: double.infinity,
      color: Theme.of(context).accentColor,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            0, MediaQuery.of(context).size.height * .3, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.info_outline,
                color: Theme.of(context).buttonColor,
              ),
              onPressed: () {
                print("Pressed");
                _showDialog();
              },
            ),
            Text(
              "Full month view",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Notifications",
                    style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    "View All",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.red.shade500),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
              color: Theme.of(context).accentColor,
              child: StreamBuilder<List<Notification_Model>>(
                stream: homebloc.allNotificationData,
                builder: (context,
                    AsyncSnapshot<List<Notification_Model>> snapshot) {
                  if (snapshot.hasData) {
                    fetcheddata = snapshot.data;
                    //_newData = fetcheddata;
                    print("Data gula:: ");

                    //TODO::eikhan theke kaj shuru hbe ashar por
                    //TODO::fetched data new datay copy hoise
                    //TODO::normally ja fetch hoye ashbe oitai new data list e dhuke jabe
                    //TODO::filter amake oi newlist theke kora lagbe search korar jonne

                    print(fetcheddata.length);
                    return masterdataview(fetcheddata);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showDialog() async {
    await showDialog<String>(
        context: context,
        builder: (_) => StatefulBuilder(
              builder: (context, setState) {
                return new AlertDialog(
                  backgroundColor: Colors.white.withOpacity(.9),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  content: Builder(
                    builder: (context) {
                      // Get available height and width of the build area of this widget. Make a choice depending on the size.
                      var height = MediaQuery.of(context).size.height * .6;
                      var width = MediaQuery.of(context).size.width * .9;

                      return Container(
                        height: height,
                        width: width,
                        child: Column(
                          children: <Widget>[
                            Align(
                              child: IconButton(
                                icon: Icon(
                                  AntDesign.closecircleo,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              alignment: Alignment.topRight,
                            ),
                            Column(
                              children: <Widget>[
                                Icon(
                                  MaterialIcons.info_outline,
                                  color: Theme.of(context).backgroundColor,
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "Monthly Attendance Report",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Theme.of(context).backgroundColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            ResponsiveGridRow(
                              children: [
                                ResponsiveGridCol(
                                  lg: 12,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 15.0),
                                              child: Text(
                                                "DATE",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 60.0),
                                              child: Text(
                                                "IN",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 60.0),
                                              child: Text(
                                                "OUT",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 40.0),
                                              child: Text(
                                                "STATUS",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      )
                                    ],
                                  ),
                                ),
                                ResponsiveGridCol(
                                  lg: 12,
                                  child: ListView(
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                "01-09-2020",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Text(
                                                "9.30AM",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Text(
                                                "6.00PM",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Text(
                                                "Present",
                                                style: GoogleFonts.poppins(
                                                  color: Colors.green,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                "02-09-2020",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Text(
                                                "10.30AM",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Text(
                                                "7.00PM",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Column(
                                                children: <Widget>[
                                                  Text(
                                                    "Late",
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.red,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  Text(
                                                    "20 Mins",
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.red,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          Divider(),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ));
  }

  Widget masterdataview(data) {
    return fetcheddata.length != 0
        ? RefreshIndicator(
            color: Theme.of(context).backgroundColor,
            key: _refreshIndicatorKey,
            onRefresh: () {
              return homebloc.fetchAllNotificationdata();
            },
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: fetcheddata.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    shadowColor: Colors.grey.withOpacity(1),
                    color: Colors.white,
                    child: Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width * .9,
                      child: ListTile(
                        title: Text(
                          data[index].NotTitle.toString(),
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.red.shade500),
                          ),
                        ),
                        subtitle: Text(
                          data[index].NotDetails.toString(),
                          style: GoogleFonts.poppins(
                            textStyle:
                                TextStyle(fontSize: 13, color: Colors.black87),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          )
        : Center(child: Text("No data"));
  }
}
