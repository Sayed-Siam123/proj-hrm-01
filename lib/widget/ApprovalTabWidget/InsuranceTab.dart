import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_app/Bloc/approval_bloc.dart';
import 'package:hrm_app/models/InsuranceApprovalUPDATEdata_model.dart';
import 'package:hrm_app/models/InsuranceType_Model.dart';

class InsuranceTab extends StatefulWidget {
  @override
  _InsuranceTabState createState() => _InsuranceTabState();
}

class _InsuranceTabState extends State<InsuranceTab> {

  InsuranceApprovaldata insurancedata;
  List<InsuranceType_Approve> fetcheddata = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    approvalbloc.fetchAllInsuranceApprovaldata();
  }

  @override
  Widget build(BuildContext context) {
      return Container(
          margin: EdgeInsets.only(top: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  "Recent",
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: StreamBuilder<List<InsuranceType_Approve>>(
                    stream: approvalbloc.allInsuranceApprovalData,
                    builder: (context,
                        AsyncSnapshot<List<InsuranceType_Approve>> snapshot) {
                      if (snapshot.hasData) {
                        fetcheddata = snapshot.data;
                        //_newData = fetcheddata;
                        print("Data gula:: ");

                        print(fetcheddata.length);
                        return verticalList1(fetcheddata);
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }

                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ),
            ],
          ));
    }

    Widget verticalList1(data) {
      return RefreshIndicator(
        color: Theme.of(context).backgroundColor,
        onRefresh: () {
          return approvalbloc.fetchAllInsuranceApprovaldata();
        },
        child: Container(
            child: new ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: fetcheddata.length,
              padding: EdgeInsets.only(top: 10, left: 0, right: 0, bottom: 0),
              itemBuilder: (context, index) {
                return data[index].LeaveDates.toString() == "Pending" ? Container(
                  height: 140,
                  margin: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  padding: EdgeInsets.only(top: 0, left: 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                          color: Colors.grey.shade300),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Align(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).buttonColor,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(9),
                                    bottomRight: Radius.circular(9),
                                  ),
                                ),
                                margin: EdgeInsets.fromLTRB(18, 0, 0, 0),
                                width: 140,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:3,bottom: 4),
                                    child: Text(
                                      data[index].AppFor.toString(),
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        textStyle:
                                        TextStyle(color: Colors.white, fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              alignment: Alignment.topLeft,
                            ),
                            Align(
                              child: Container(
                                margin: EdgeInsets.fromLTRB(10, 30, 0, 0),
                                height: 80,
                                width: 230,
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 15.0, top: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        data[index].Description.toString(),
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "From " + data[index].RequestStatus.toString(),
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            Align(
                              child: Container(
                                margin: EdgeInsets.fromLTRB(18, 5, 18, 0),
                                height: 90,
                                width: 140,
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "# " + data[index].RequestNo.toString(),
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          data[index].RequestDate.toString(),
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                color: Colors.black54, fontSize: 15),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              alignment: Alignment.topRight,
                            ),
                            Align(
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 90, 15, 0),
                                height: 40,
                                width: 220,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    data[index].LeaveDates.toString() == "Pending"
                                        ? InkWell(
                                      child: Container(
                                        height: 30,
                                        width: 70,
                                        margin: EdgeInsets.only(right: 3),
                                        decoration: BoxDecoration(
                                          color:
                                          Theme.of(context).backgroundColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(0)),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "ACCEPT",
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                color:
                                                Theme.of(context).accentColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        print("Approved");
                                        print(data[index].Id.toString());

                                        insurancedata = InsuranceApprovaldata(
                                          Uid: "6",
                                          Rid: data[index].Id.toString(),
                                          status: 1,
                                        );

                                        Timer(Duration(milliseconds: 50), () {
                                          Scaffold.of(context).showSnackBar(SnackBar(
                                            content: Text(
                                              'Approved Successfully',
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

                                        approvalbloc.InsuranceApprovalPost(insurancedata);
                                        approvalbloc.fetchAllInsuranceApprovaldata();
                                      },
                                    )
                                        : Container(
                                      height: 30,
                                      width: 70,
                                      margin: EdgeInsets.only(right: 3),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade400,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(0)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "ACCEPT",
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              color:
                                              Theme.of(context).accentColor,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),

                                    InkWell(
                                      onTap: () {

                                        print("Rejected");
                                        print(data[index].Id.toString());

                                        insurancedata = InsuranceApprovaldata(
                                          Uid: "6",
                                          Rid: data[index].Id.toString(),
                                          status: 0,
                                        );

                                        approvalbloc.InsuranceApprovalPost(insurancedata);
                                        approvalbloc.fetchAllInsuranceApprovaldata();

                                      },
                                      child: Container(
                                        height: 30,
                                        width: 70,
                                        margin: EdgeInsets.only(right: 3),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).buttonColor,
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(0)),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "REJECT",
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                color: Theme.of(context).accentColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              alignment: Alignment.bottomRight,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ): Container(height: 0,width: 0,);
              },
            )),
      );
    }
}