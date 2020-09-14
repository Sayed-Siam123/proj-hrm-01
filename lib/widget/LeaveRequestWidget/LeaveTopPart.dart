import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_app/Bloc/leave_request_bloc.dart';
import 'package:hrm_app/models/LeaveSummery_Mode.dart';
import 'package:responsive_grid/responsive_grid.dart';

class LeaveTopPart extends StatefulWidget {
  @override
  _LeaveTopPartState createState() => _LeaveTopPartState();
}

class _LeaveTopPartState extends State<LeaveTopPart> {
  List<LeaveSummery_Model> fetcheddata = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    leaverequestbloc.fetchAllLeaveSummerydata();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
      color: Theme.of(context).backgroundColor,
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
            color: Theme.of(context).backgroundColor,
            child: StreamBuilder<List<LeaveSummery_Model>>(
              stream: leaverequestbloc.allLeaveSummeryData,
              builder:
                  (context, AsyncSnapshot<List<LeaveSummery_Model>> snapshot) {
                if (snapshot.hasData) {
                  fetcheddata = snapshot.data;
                  //_newData = fetcheddata;
                  print("Data gula:: ");

                  //TODO::eikhan theke kaj shuru hbe ashar por
                  //TODO::fetched data new datay copy hoise
                  //TODO::normally ja fetch hoye ashbe oitai new data list e dhuke jabe
                  //TODO::filter amake oi newlist theke kora lagbe search korar jonne

                  print(fetcheddata.length);
                  return LeaveSummery(fetcheddata);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget LeaveSummery(data) {
    return ResponsiveGridRow(
      children: [
        ResponsiveGridCol(
          lg: 12,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LEAVE TYPE",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),

              //eikhan theke streamer run korbe

              SizedBox(width: 20,),

              Text(
                "ASSIGNED",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),

              SizedBox(width: 20,),

              Text(
                "ENJOYED",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),

              SizedBox(width: 20,),

              Text(
                "REMAINS",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
        ResponsiveGridCol(
          lg: 12,
          child: ListView.builder(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            shrinkWrap: true,
            itemCount: fetcheddata.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.fromLTRB(55, 0, 55, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 50,
                      child: Text(
                        fetcheddata[index].LeaveType.toString(),
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),

                    //eikhan theke streamer run korbe

                    SizedBox(width: 0,),

                    Container(
                      width: 20,
                      child: Text(
                        fetcheddata[index].LeaveAssign.toString(),
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),

                    SizedBox(width: 0,),

                    Container(
                      width: 20,
                      child: Text(
                        fetcheddata[index].LeaveEnjoyed.toString(),
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),

                    SizedBox(width: 0,),

                    Container(
                      width: 20,
                      child: Text(
                        fetcheddata[index].LeaveBalance.toString(),
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
