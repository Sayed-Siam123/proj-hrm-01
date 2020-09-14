import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_app/ColorLibrary/HexColor.dart';
import 'package:responsive_grid/responsive_grid.dart';

class InsuranceTabWidget extends StatefulWidget {
  @override
  _InsuranceTabWidgetState createState() => _InsuranceTabWidgetState();
}

class _InsuranceTabWidgetState extends State<InsuranceTabWidget> {
  Color button_red = HexColor("#E8505B");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                xs: 1,
                md: 1,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "#",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Text(
                        "01",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "02",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ResponsiveGridCol(
                xs: 4,
                md: 4,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Insurance Name",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Text(
                        "Metlife Alico",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Metlife Alico",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ResponsiveGridCol(
                xs: 4,
                md: 4,
                child: Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Policy Number",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        Text(
                          "2002",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "4001",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              ResponsiveGridCol(
                xs: 3,
                md: 3,
                child: Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Expires On",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        Text(
                          "22-09-2020",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "22-09-2020",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              // ResponsiveGridCol(
              //   xs: 3,
              //   md: 3,
              //   child: Container(
              //     child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: <Widget>[
              //           Text(
              //             "Action",
              //             style: GoogleFonts.poppins(
              //               textStyle: TextStyle(
              //                   fontSize: 14, fontWeight: FontWeight.w500),
              //             ),
              //           ),
              //           SizedBox(
              //             height: 10,
              //           ),
              //
              //           Row(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: <Widget>[
              //               Container(
              //                 margin: EdgeInsets.only(left: 5),
              //                 decoration: BoxDecoration(
              //                   shape: BoxShape.circle,
              //                   color: Colors.white,
              //                   boxShadow: [
              //                     BoxShadow(
              //                         blurRadius: 5.0,
              //                         spreadRadius: 1.0,
              //                         color: Colors.grey.shade300),
              //                   ],
              //                 ),
              //                 child: SizedBox(
              //                   height: 32,
              //                   width: 32,
              //                   child: IconButton(
              //                     onPressed: (){
              //                       print("Tapped1");
              //                     },
              //                     iconSize: 24,
              //                     icon: Icon(Icons.edit),
              //                     color: Theme.of(context).buttonColor,
              //                     padding: EdgeInsets.all(5),
              //                     //visualDensity: VisualDensity.comfortable,
              //                   ),
              //                 ),
              //               ),
              //
              //               SizedBox(
              //                 width: 10,
              //               ),
              //
              //               GestureDetector(
              //                 onTap: (){
              //                   print("Tapped rn");
              //                 },
              //                 child: Container(
              //                   margin: EdgeInsets.only(left: 0),
              //                   decoration: BoxDecoration(
              //                     shape: BoxShape.circle,
              //                     color: Colors.white,
              //                     boxShadow: [
              //                       BoxShadow(
              //                           blurRadius: 5.0,
              //                           spreadRadius: 1.0,
              //                           color: Colors.grey.shade300),
              //                     ],
              //                   ),
              //                   child: SizedBox(
              //                       height: 32,
              //                       width: 32,
              //                       child: Center(
              //                         child: Text(
              //                           "RN",
              //                           style: GoogleFonts.poppins(
              //                             textStyle: TextStyle(
              //                                 color: Theme.of(context).buttonColor,
              //                                 fontWeight: FontWeight.w600
              //                             ),
              //                           ),
              //                         ),
              //                       )),
              //                 ),
              //               ),
              //
              //             ],
              //           ),
              //
              //           SizedBox(
              //             height: 20,
              //           ),
              //
              //           Row(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: <Widget>[
              //               GestureDetector(
              //                 child: Container(
              //                   margin: EdgeInsets.only(left: 5),
              //                   decoration: BoxDecoration(
              //                     shape: BoxShape.circle,
              //                     color: Colors.white,
              //                     boxShadow: [
              //                       BoxShadow(
              //                           blurRadius: 5.0,
              //                           spreadRadius: 1.0,
              //                           color: Colors.grey.shade300),
              //                     ],
              //                   ),
              //                   child: SizedBox(
              //                     height: 32,
              //                     width: 32,
              //                     child: IconButton(
              //                       onPressed: (){
              //                         print("Tapped here also");
              //                       },
              //                       iconSize: 24,
              //                       icon: Icon(Icons.edit),
              //                       color: Theme.of(context).buttonColor,
              //                       padding: EdgeInsets.all(5),
              //                       //visualDensity: VisualDensity.comfortable,
              //                     ),
              //                   ),
              //                 ),
              //                 onTap: (){
              //                   print("Tapped here also");
              //                 },
              //               ),
              //
              //               SizedBox(
              //                 width: 10,
              //               ),
              //
              //               GestureDetector(
              //                 onTap: (){
              //                   print("Tapped RN");
              //                 },
              //                 child: Container(
              //                   margin: EdgeInsets.only(left: 0),
              //                   decoration: BoxDecoration(
              //                     shape: BoxShape.circle,
              //                     color: Colors.white,
              //                     boxShadow: [
              //                       BoxShadow(
              //                           blurRadius: 5.0,
              //                           spreadRadius: 1.0,
              //                           color: Colors.grey.shade300),
              //                     ],
              //                   ),
              //                   child: SizedBox(
              //                       height: 32,
              //                       width: 32,
              //                       child: Center(
              //                         child: Text(
              //                           "RN",
              //                           style: GoogleFonts.poppins(
              //                             textStyle: TextStyle(
              //                               color: Theme.of(context).buttonColor,
              //                               fontWeight: FontWeight.w600
              //                             ),
              //                           ),
              //                         ),
              //                       )),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ]),
              //   ),
              // ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).buttonColor,
        child: Icon(Icons.add,size: 35),
        onPressed: (){
          print("Insurance Add");
        },
      ),
    );
  }
}
