import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_app/pages/LeaveRequest.dart';
import 'package:hrm_app/pages/MyInsurance.dart';
import 'package:hrm_app/pages/MyLoan.dart';
import 'package:hrm_app/pages/MyVisa.dart';
import 'package:hrm_app/pages/Resignation.dart';

class RequestTabWidget extends StatefulWidget {
  @override
  _RequestTabWidgetState createState() => _RequestTabWidgetState();
}

class _RequestTabWidgetState extends State<RequestTabWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(15, 30, 0, 0),
          child: Text(
            "Category",
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 150,
          width: double.infinity,
          color: Colors.white,
          child: horizontalList1(),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
          child: Text(
            "Recent",
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            color: Colors.white,
            child: verticalList1(),
          ),
        ),
      ],
    ));
  }

  Widget horizontalList1() {
    return Container(
        margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
        child: new ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.only(top: 0, left: 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                      color: Colors.grey.shade300),
                ],
              ),
              width: 150.0,
              child: GestureDetector(
                onTap: (){
                  print("sasa");
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LeaveRequestPage()),
                  );

                },
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Leave",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Request",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.only(top: 0, left: 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                      color: Colors.grey.shade300),
                ],
              ),
              child: Container(
                width: 150.0,
                child: GestureDetector(
                  onTap: (){
                    print("sasa");
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MyVisaPage()),
                    );
                  },
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Renew",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "Visa",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.only(top: 0, left: 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                      color: Colors.grey.shade300),
                ],
              ),
              child: Container(
                width: 150.0,
                child: GestureDetector(
                  onTap: (){
                    print("sasa");
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MyInsurancePage()),
                    );
                  },
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Renew",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "Insurance",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              width: 10,
            ),

            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.only(top: 0, left: 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                      color: Colors.grey.shade300),
                ],
              ),
              child: Container(
                width: 150.0,
                child: GestureDetector(
                  onTap: (){
                    print("sasa");
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MyLoanPage()),
                    );
                  },
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Apply",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "Loan",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),


            SizedBox(
              width: 10,
            ),

            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.only(top: 0, left: 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                      color: Colors.grey.shade300),
                ],
              ),
              child: Container(
                width: 150.0,
                child: GestureDetector(
                  onTap: (){
                    print("sasa");
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ResignationPage()),
                    );
                  },
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Resignation",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

          ],
        ));
  }

  Widget verticalList1() {
    return Container(
        child: new ListView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(top: 10, left: 0, right: 0, bottom: 0),
      children: <Widget>[
        Container(
          height: 125,
          margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
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
                        width:120,
                        decoration: BoxDecoration(
                          color: Theme.of(context).buttonColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(9),
                            bottomRight: Radius.circular(9),
                          ),
                        ),
                        margin: EdgeInsets.fromLTRB(18, 0, 0, 0),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left:4.0,right:4, top:3, bottom:3),
                            child: Text(
                              "Medical Leave",
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
                        margin: EdgeInsets.fromLTRB(10, 25, 0, 0),
                        height: 80,
                        width: 230,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15.0, top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Leave Request",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Theme.of(context).buttonColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Health Condition not ok",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "From 21-09-20 to 23-09-20",
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
                        height: 120,
                        width: 140,
                        color: Colors.white,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "#21242",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Text(
                                  "22-09-2020",
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
                      alignment: Alignment.centerRight,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          height: 125,
          margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
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
                        width:120,
                        decoration: BoxDecoration(
                          color: Theme.of(context).buttonColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(9),
                            bottomRight: Radius.circular(9),
                          ),
                        ),
                        margin: EdgeInsets.fromLTRB(18, 0, 0, 0),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left:4.0,right:4, top:3, bottom:3),
                            child: Text(
                              "Medical Leave",
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
                        margin: EdgeInsets.fromLTRB(10, 25, 0, 0),
                        height: 80,
                        width: 230,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15.0, top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Leave Request",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Theme.of(context).buttonColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Health Condition not ok",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "From 21-09-20 to 23-09-20",
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
                        height: 120,
                        width: 140,
                        color: Colors.white,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "#21242",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Text(
                                  "22-09-2020",
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
                      alignment: Alignment.centerRight,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
