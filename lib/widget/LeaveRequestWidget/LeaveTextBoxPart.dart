import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_app/Bloc/leave_request_bloc.dart';
import 'package:hrm_app/helper/MainPage.dart';
import 'package:hrm_app/models/LeaveRequestSubmit_Model.dart';
import 'package:hrm_app/models/LeaveTypeCategory_Model.dart';
import 'package:intl/intl.dart';
import 'package:responsive_grid/responsive_grid.dart';

class LeaveTextBoxPart extends StatefulWidget {
  @override
  _LeaveTextBoxPartState createState() => _LeaveTextBoxPartState();
}

class _LeaveTextBoxPartState extends State<LeaveTextBoxPart> {
  DateTime selectedFromDate = DateTime.now();
  DateTime selectedToDate = DateTime.now();
  DateFormat formatter = DateFormat('dd/MM/yyyy');
  String formatted;
  TextEditingController fromDate = new TextEditingController();
  TextEditingController toDate = new TextEditingController();
  TextEditingController leaveCause = new TextEditingController();
  TextEditingController phoneNumber = new TextEditingController();
  String leaveTypeID = "";
  List<LeaveType_Model> fetcheddata = [];
  LeaveType_Model dropdownValue;
  LeaveRequestData data;

  bool _validate1;
  bool _validate2;
  bool _validate3;

  String errortext1 = "*Date can\'t be empty";
  String errortext2 = "*Date can\'t be empty";
  String errortext3 = "*Leave reason can\'t be empty";

  _selectFromDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedFromDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedFromDate)
      setState(() {
        selectedFromDate = picked;
      });
    formatted = formatter.format(selectedFromDate);
    print(formatted);
    fromDate.text = formatted;
  }

  _selectToDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedToDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedToDate)
      setState(() {
        selectedToDate = picked;
      });
    formatted = formatter.format(selectedToDate);
    print(formatted);
    toDate.text = formatted;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetcheddata.clear();
    leaverequestbloc.fetchAllLeaveTypedata();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 210, 30, 0),
      height: MediaQuery
          .of(context)
          .size
          .height * .67,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(9)),
        color: Theme
            .of(context)
            .accentColor,
        boxShadow: [
          BoxShadow(
              blurRadius: 5.0,
              spreadRadius: 5.0,
              offset: Offset(1, 1),
              color: Colors.grey.shade600.withOpacity(0.1)),
        ],
      ),
      child: ResponsiveGridRow(
        children: [
          ResponsiveGridCol(
            lg: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 55,
                  margin: EdgeInsets.fromLTRB(15, 40, 15, 0),
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5.0,
                          spreadRadius: 5.0,
                          offset: Offset(1, 1),
                          color: Colors.grey.shade600.withOpacity(0.1)),
                    ],
                  ),
                  // child: DropdownButton<LeaveType_Model>(
                  //     hint: Text(
                  //       "Select Leave Type",
                  //       style: GoogleFonts.poppins(
                  //         textStyle: TextStyle(fontSize: 16),
                  //       ),
                  //     ),
                  //     isExpanded: true,
                  //     value: dropdownValue,
                  //     icon: Icon(Icons.unfold_more),
                  //     iconSize: 25,
                  //     underline: SizedBox(),
                  //     onChanged: (LeaveType_Model newValue) {
                  //       setState(() {
                  //         dropdownValue = newValue;
                  //       });
                  //       print(dropdownValue.type.toString());
                  //     },
                  //     items: fetcheddata.map<DropdownMenuItem<LeaveType_Model>>(
                  //             (LeaveType_Model value) {
                  //           return DropdownMenuItem<LeaveType_Model>(
                  //             value: value,
                  //             child: Text(
                  //               value.type,
                  //               style: GoogleFonts.poppins(
                  //                 textStyle:
                  //                 TextStyle(fontSize: 16),
                  //               ),
                  //             ),
                  //           );
                  //         }).toList()),

                  child: StreamBuilder<List<LeaveType_Model>>(
                    stream: leaverequestbloc.allLeaveTypeData,
                    builder: (context,
                        AsyncSnapshot<List<LeaveType_Model>> snapshot) {
                      if (snapshot.hasData) {
                        fetcheddata = snapshot.data;
                        //_newData = fetcheddata;
                        print("Data gula:: ");

                        //TODO::eikhan theke kaj shuru hbe ashar por
                        //TODO::fetched data new datay copy hoise
                        //TODO::normally ja fetch hoye ashbe oitai new data list e dhuke jabe
                        //TODO::filter amake oi newlist theke kora lagbe search korar jonne

                        print(fetcheddata.length);
                        return fetcheddata.length != 0
                            ? Container(
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: DropdownButton<LeaveType_Model>(
                              hint: Text(
                                "Select Leave Type",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(fontSize: 14),
                                ),
                              ),
                              isExpanded: true,
                              value: dropdownValue,
                              icon: Icon(Icons.unfold_more),
                              iconSize: 25,
                              underline: SizedBox(),
                              onChanged: (LeaveType_Model newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                });

                                setState(() {
                                  leaveTypeID = dropdownValue.Id.toString();
                                });
                              },
                              items: fetcheddata
                                  .map<DropdownMenuItem<LeaveType_Model>>(
                                      (LeaveType_Model value) {
                                    return DropdownMenuItem<LeaveType_Model>(
                                      value: value,
                                      child: Text(
                                        value.type,
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(fontSize: 14),
                                        ),
                                      ),
                                    );
                                  }).toList()),
                        )
                            : Center(child: Text("No data"));
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }

                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                        height: 55,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .38,
                        margin: EdgeInsets.fromLTRB(11, 15, 0, 0),
                        padding: EdgeInsets.fromLTRB(15, 3, 5, 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5.0,
                                spreadRadius: 5.0,
                                offset: Offset(1, 1),
                                color: Colors.grey.shade600.withOpacity(0.1)),
                          ],
                        ),
                        child: TextField(
                          controller: fromDate,
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
                                  color: Theme
                                      .of(context)
                                      .buttonColor
                                      .withOpacity(0.4),
                                ),
                                onPressed: () {
                                  _selectFromDate(context);
                                  print("From");
                                },
                              ),
                              hintText: "From",
                              hintStyle: GoogleFonts.poppins(
                                textStyle: TextStyle(fontSize: 14),
                              ),
                              errorText: _validate1 == false
                                  ? errortext1
                                  : null,
                              contentPadding: _validate1 == false ? EdgeInsets
                                  .fromLTRB(0, 20, 0, 0) : EdgeInsets.fromLTRB(
                                  0, 15, 0, 0)
                          ),
                        )),
                    Container(
                        height: 55,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .38,
                        margin: EdgeInsets.fromLTRB(0, 15, 11, 0),
                        padding: EdgeInsets.fromLTRB(15, 3, 5, 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5.0,
                                spreadRadius: 5.0,
                                offset: Offset(1, 1),
                                color: Colors.grey.shade600.withOpacity(0.1)),
                          ],
                        ),
                        child: TextField(
                          controller: toDate,
                          enabled: true,
                          readOnly: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.calendar_today,
                                  color: Theme
                                      .of(context)
                                      .buttonColor
                                      .withOpacity(0.4),
                                ),
                                onPressed: () {
                                  _selectToDate(context);
                                  print("To");
                                },
                              ),
                              hintText: "To",
                              hintStyle: GoogleFonts.poppins(
                                textStyle: TextStyle(fontSize: 16),
                              ),
                              errorText: _validate2 == false
                                  ? errortext2
                                  : null,
                              contentPadding: _validate2 == false ? EdgeInsets
                                  .fromLTRB(0, 20, 0, 0) : EdgeInsets.fromLTRB(
                                  0, 15, 0, 0)
                          ),
                        )),
                  ],
                ),
                Container(
                    height: 55,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                    padding: EdgeInsets.fromLTRB(15, 3, 5, 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5.0,
                            spreadRadius: 5.0,
                            offset: Offset(1, 1),
                            color: Colors.grey.shade600.withOpacity(0.1)),
                      ],
                    ),
                    child: TextField(
                      controller: leaveCause,
                      enabled: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "Leave reason",
                          hintStyle: GoogleFonts.poppins(
                            textStyle: TextStyle(fontSize: 14),
                          ),
                          errorText: _validate3 == false ? errortext3 : null,
                          contentPadding: _validate3 == false ? EdgeInsets
                              .fromLTRB(0, 20, 0, 0) : EdgeInsets.fromLTRB(
                              0, 15, 0, 0)
                      ),
                    )),
                InkWell(
                  onTap: () {
                    if (fromDate.text.isEmpty && fromDate.text == "") {
                      print("KHali");

                      setState(() {
                        _validate2 = true;
                        _validate1 = false;
                        _validate3 = true;
                      });

                      //TODO:: Toast hobe ekta
                    } else if (toDate.text.isEmpty && toDate.text == "") {
                      print("eitao KHali");

                      setState(() {
                        _validate1 = true;
                        _validate2 = false;
                        _validate3 = true;
                      });

                      //TODO:: Toast hobe ekta
                    } else if (leaveCause.text.isEmpty &&
                        leaveCause.text == "") {
                      setState(() {
                        _validate1 = true;
                        _validate2 = true;
                        _validate3 = false;
                      });
                    } else {
                      _validate1 = true;
                      _validate2 = true;
                      _validate3 = true;
                    }
                    print("Vora");

                    data = LeaveRequestData(
                        LeaveType: leaveTypeID.toString(),
                        FromDate: fromDate.text.toString(),
                        ToDate: toDate.text.toString(),
                        LeaveReason: leaveCause.text.toString()
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
                      print(fromDate.text.toString() + "," +
                          leaveTypeID.toString());

                      leaverequestbloc.CreateLeavePost(data);

                      fromDate.text = "";
                      toDate.text = "";
                      leaveCause.text = "";

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainPage(currentIndex: 1,)),
                      );

                    });
                  },
                  child: Container(
                    height: 55,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    margin: EdgeInsets.fromLTRB(15, 115, 15, 0),
                    padding: EdgeInsets.fromLTRB(15, 3, 5, 0),
                    decoration: BoxDecoration(
                      color: Theme
                          .of(context)
                          .buttonColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5.0,
                            spreadRadius: 5.0,
                            offset: Offset(1, 1),
                            color: Colors.grey.shade600.withOpacity(0.1)),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "APPLY",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 16,
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
    );
  }
}
