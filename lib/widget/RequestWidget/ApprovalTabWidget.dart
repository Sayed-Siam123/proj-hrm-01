import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_app/Bloc/approval_bloc.dart';
import 'package:hrm_app/widget/ApprovalTabWidget/LeaveTab.dart';
import 'package:hrm_app/widget/ApprovalTabWidget/InsuranceTab.dart';
import 'package:hrm_app/widget/ApprovalTabWidget/LoanTab.dart';
import 'package:hrm_app/widget/ApprovalTabWidget/ResignationTab.dart';
import 'package:hrm_app/widget/ApprovalTabWidget/VisaTab.dart';
import 'package:responsive_grid/responsive_grid.dart';

import 'MeetingsTabWidget.dart';
import 'RequestTabWidget.dart';


class ApprovalTabWidget extends StatefulWidget {
  @override
  _ApprovalTabWidgetState createState() => _ApprovalTabWidgetState();
}

class _ApprovalTabWidgetState extends State<ApprovalTabWidget>  with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 70, 0, 0),
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height*.9,
                  width: MediaQuery.of(context).size.width,
                  child: ResponsiveGridRow(
                    children: [
                      ResponsiveGridCol(
                        lg: 12,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: MediaQuery.of(context).size.height*.6,
                              width: MediaQuery.of(context).size.width,
                              child: TabBarView(
                                controller: _tabController,
                                children: [
                                  new LeaveTab(),
                                  new VisaTab(),
                                  new InsuranceTab(),
                                  new LoanTab(),
                                  new ResignationTab(),
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
                  color: Theme.of(context).accentColor,
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: ResponsiveGridRow(
                    children: [
                      ResponsiveGridCol(
                        lg: 12,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                                  width: MediaQuery.of(context).size.width*.9,
                                  child: TabBar(
                                    indicatorWeight: 5,
                                    labelStyle: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                    unselectedLabelColor: Colors.grey.shade400,
                                    labelColor: Colors.black87,
                                    labelPadding: EdgeInsets.only(left: 25),
                                    tabs: [
                                      new Tab(
                                        text: "Leave",
                                      ),
                                      new Tab(text: "Visa"),
                                      new Tab(text: "Insurance"),
                                      new Tab(text: "Loan"),
                                      new Tab(text: "Resignation"),
                                    ],
                                    controller: _tabController,
                                    indicatorColor: Colors.transparent,
                                    isScrollable: true,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ]),
        )
      ],
    )
    ;
  }
}
