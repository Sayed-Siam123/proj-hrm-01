import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_grid/responsive_grid.dart';

class SalaryTabWidget extends StatefulWidget {
  @override
  _SalaryTabWidgetState createState() => _SalaryTabWidgetState();
}

class _SalaryTabWidgetState extends State<SalaryTabWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "My Salary and Bonuses",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),

          SizedBox(height: 5,),
          ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                xs: 2,
                md: 2,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Basic",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        "56000",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ResponsiveGridCol(
                xs: 3,
                md: 3,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Allowance",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        "House Rent",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(fontSize: 13),
                        ),
                      ),
                      Text(
                        "Medical",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ResponsiveGridCol(
                xs: 3,
                md: 3,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Amount",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        "30000",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(fontSize: 13),
                        ),
                      ),
                      Text(
                        "15000",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ResponsiveGridCol(
                xs: 3,
                md: 3,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Others",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        "-",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(fontSize: 13),
                        ),
                      ),
                      Text(
                        "-",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.black87,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                "Total:",
                style: GoogleFonts.poppins(
                  textStyle:
                      TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "101,345",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(fontSize: 13),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
