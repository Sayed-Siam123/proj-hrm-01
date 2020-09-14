import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:hrm_app/models/InsuranceApprovalUPDATEdata_model.dart';
import 'package:hrm_app/models/InsuranceSubmit_Model.dart';
import 'package:hrm_app/models/InsuranceType_Model.dart';
import 'package:hrm_app/models/LeaveApprovalUPDATEdata_model.dart';
import 'package:hrm_app/models/LeaveRequestSubmit_Model.dart';
import 'package:hrm_app/models/LeaveSummery_Mode.dart';
import 'package:hrm_app/models/LeaveTypeCategory_Model.dart';
import 'package:hrm_app/models/LeaveType_Model.dart';
import 'package:hrm_app/models/Notification_Model.dart';
import 'package:hrm_app/models/Userlogin_Model.dart';
import 'package:hrm_app/models/VisaApprovalUPDATEdata_model.dart';
import 'package:hrm_app/models/VisaSubmit_Model.dart';
import 'package:hrm_app/models/VisaType_Model.dart';
import 'package:hrm_app/models/success_for_post.dart';
import 'package:hrm_app/resources/SharedPrefer.dart';
import 'package:http/http.dart' show Client;

class ApiProvider{

  Client client = Client();

  SessionManager prefs =  SessionManager();
  String loginKey = "loginKey";
  String useridKey = "userid";
  String loginName = "loginName";
  String userDesignation = "userDesignation";
  String PresentStatus = "PresentStatus";
  String LateStatus = "LateStatus";
  String Intimes = "Intimes";
  String MonthPresent = "MonthPresent";
  String MonthAbesnt = "MonthAbesnt";
  String MonthLeave = "MonthLeave";
  String MonthLate = "MonthLate";

  String userID="";

  void getUserID() async {

    Future<String> _userID = prefs.getData(useridKey);
    _userID.then((data) {

      print('serverip pabo');
      print("serverip " + data.toString());
      this.userID = data.toString();

//      Future.delayed(const Duration(milliseconds: 1000), () {
//
//      });
    },onError: (e) {
      print(e);
    });

  }

  Future<UserLogin_model> userlogin(Uid,Upas) async{

    print("data from apiprovider :: " + Uid.toString() + " " + Upas.toString());
    //${GlobalConfiguration().getString('api_base_url2')}


    //final response = await client.get("http://202.164.212.238:8056/WS.asmx/GetUserLogin?Uid="+Uid.toString()+"&Upas="+Upas.toString());
    final response = await client.get("${GlobalConfiguration().getString('api_base_url2')}"+"GetUserLogin?Uid="+Uid.toString()+"&Upas="+Upas.toString());

    //final response = await client.get("http://172.16.61.221:8056/WS.asmx/GetUserLogin?Uid="+Uid.toString()+"&Upas="+Upas.toString());
    print("api_base_url2: ${GlobalConfiguration().getString('api_base_url2')}"); // need to use for api call
    if (response.statusCode == 200) {

      debugPrint("From singleGet Class:: "+json.decode(response.body).toString());
      return UserLogin_model.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('${response.statusCode}');
    }

  }


  Future<List<Notification_Model>> fetchAllNotificationdata() async {

    getUserID();
    await new Future.delayed(const Duration(milliseconds: 1000));
    //1sec delay

    print("${GlobalConfiguration().getString('api_base_url2')}");
    print(userID.toString());
//    print(Uid.toString());
    //then it will get data
    print("fetch from apiprovider");
    final response = await client.get("${GlobalConfiguration().getString('api_base_url2')}"+"GetUserNotifications?Uid="+userID.toString());

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      //List<dynamic> values = new List<dynamic>();

      //values = json.decode(response.body);

      debugPrint("From Get Class:: "+jsonResponse.toString());
      return jsonResponse.map((notificationdata) => new Notification_Model.fromJson(notificationdata)).toList();
    }
    else {
      throw Exception('Failed to load jobs from API');
    }
  }

  Future<List<LeaveType_Model>> fetchAllLeaveTypedata() async {

    getUserID();
    await new Future.delayed(const Duration(milliseconds: 1000));

    //then it will get data
    print("fetch from apiprovider");
    final response = await client.get("${GlobalConfiguration().getString('api_base_url2')}"+"GetLeaveType?Uid="+userID.toString());

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      //List<dynamic> values = new List<dynamic>();

      //values = json.decode(response.body);

      debugPrint("From Get Class:: "+jsonResponse.toString());
      return jsonResponse.map((leavedata) => new LeaveType_Model.fromJson(leavedata)).toList();
    }
    else {
      throw Exception('Failed to load jobs from API');
    }
  }

  Future<List<LeaveSummery_Model>> fetchAllLeaveSummerydata() async {


    getUserID();
    await new Future.delayed(const Duration(milliseconds: 1000));
    //then it will get data
    print("fetch from apiprovider");
    final response = await client.get("${GlobalConfiguration().getString('api_base_url2')}"+"GetLeaveSummary?Uid="+userID.toString());

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      //List<dynamic> values = new List<dynamic>();

      //values = json.decode(response.body);

      debugPrint("From Get Class:: "+jsonResponse.toString());
      return jsonResponse.map((leavedata) => new LeaveSummery_Model.fromJson(leavedata)).toList();
    }
    else {
      throw Exception('Failed to load jobs from API');
    }
  }


  Future<List<LeaveType_Approve>> fetchAllLeaveApprovaldata() async {


    getUserID();
    await new Future.delayed(const Duration(milliseconds: 1000));
    //then it will get data
    print("fetch from apiprovider");
    final response = await client.get("${GlobalConfiguration().getString('api_base_url2')}"+"GetLeaveList?Uid="+userID.toString());

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      //List<dynamic> values = new List<dynamic>();

      //values = json.decode(response.body);

      debugPrint("From Get Class:: "+jsonResponse.toString());
      return jsonResponse.map((leavedata) => new LeaveType_Approve.fromJson(leavedata)).toList();
    }
    else {
      throw Exception('Failed to load jobs from API');
    }
  }


  Future<SuccessForPost> CreateLeavePost(LeaveRequestData data) async {

    getUserID();
    await new Future.delayed(const Duration(milliseconds: 1000));
    //then it will get data
    print("fetch from apiprovider");
    final response = await client.get("${GlobalConfiguration().getString('api_base_url2')}"+"LeaveSubmit?Uid="+userID.toString()
                                        +"&LeaveType="+data.LeaveType.toString()
                                        +"&FromDate="+data.FromDate.toString()
                                        +"&ToDate="+data.ToDate.toString()
                                        +"&LeaveReason="+data.LeaveReason.toString());

    if (response.statusCode == 200) {

      //List<dynamic> values = new List<dynamic>();

      //values = json.decode(response.body);
      debugPrint("From singleGet Class:: "+json.decode(response.body).toString());
      return SuccessForPost.fromJson(json.decode(response.body));
    }
    else {
      throw Exception('Failed to load jobs from API');
    }
  }


  Future<List<VisaType_Approve>> fetchAllVisaApprovaldata() async {


    getUserID();
    await new Future.delayed(const Duration(milliseconds: 1000));
    //then it will get data
    print("fetch from apiprovider");
    final response = await client.get("${GlobalConfiguration().getString('api_base_url2')}"+"GetVisaList?Uid="+userID.toString());

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      //List<dynamic> values = new List<dynamic>();

      //values = json.decode(response.body);

      debugPrint("From Get Class:: "+jsonResponse.toString());
      return jsonResponse.map((visadata) => new VisaType_Approve.fromJson(visadata)).toList();
    }
    else {
      throw Exception('Failed to load jobs from API');
    }
  }

  Future<List<InsuranceType_Approve>> fetchAllInsuranceApprovaldata() async {


    getUserID();
    await new Future.delayed(const Duration(milliseconds: 1000));
    //then it will get data
    print("fetch from apiprovider");
    final response = await client.get("${GlobalConfiguration().getString('api_base_url2')}"+"GetInsuranceList?Uid="+userID.toString());

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      //List<dynamic> values = new List<dynamic>();

      //values = json.decode(response.body);

      debugPrint("From Get Class:: "+jsonResponse.toString());
      return jsonResponse.map((insurancedata) => new InsuranceType_Approve.fromJson(insurancedata)).toList();
    }
    else {
      throw Exception('Failed to load jobs from API');
    }
  }

  Future<SuccessForPost> CreateVisaPost(VisaSubmit data) async {

    getUserID();
    await new Future.delayed(const Duration(milliseconds: 1000));
    //then it will get data
    print("fetch from apiprovider");
    final response = await client.get("${GlobalConfiguration().getString('api_base_url2')}"+"VisaSubmit?Uid="+userID.toString()
        +"&IssueCity="+data.IssueCity.toString()
        +"&IssueDate="+data.IssueDate.toString()
        +"&ExpDate="+data.ExpDate.toString());

    if (response.statusCode == 200) {

      //List<dynamic> values = new List<dynamic>();

      //values = json.decode(response.body);
      debugPrint("From singleGet Class:: "+json.decode(response.body).toString());
      return SuccessForPost.fromJson(json.decode(response.body));
    }
    else {
      throw Exception('Failed to load jobs from API');
    }
  }

  Future<SuccessForPost> CreateInsurancePost(InsuranceSubmit data) async {

    getUserID();
    await new Future.delayed(const Duration(milliseconds: 1000));
    //then it will get data
    print("fetch from apiprovider");
    final response = await client.get("${GlobalConfiguration().getString('api_base_url2')}"+"InsuranceSubmit?Uid="+userID.toString()
        +"&ExpDate="+data.expireDate.toString());

    if (response.statusCode == 200) {

      //List<dynamic> values = new List<dynamic>();

      //values = json.decode(response.body);
      debugPrint("From singleGet Class:: "+json.decode(response.body).toString());
      return SuccessForPost.fromJson(json.decode(response.body));
    }
    else {
      throw Exception('Failed to load jobs from API');
    }
  }

  Future<SuccessForPost> LeaveApprovalPost(LeaveApprovalData data) async {
    getUserID();
    await new Future.delayed(const Duration(milliseconds: 1000));
    //then it will get data
    print("fetch from apiprovider");
    final response = await client.get("${GlobalConfiguration().getString('api_base_url2')}"+"ApproveLeave?Uid="+userID.toString()
        +"&Rid="+data.Rid.toString()
        +"&Status="+data.status.toString());

    if (response.statusCode == 200) {

      //List<dynamic> values = new List<dynamic>();

      //values = json.decode(response.body);
      debugPrint("From singleGet Class:: "+json.decode(response.body).toString());
      return SuccessForPost.fromJson(json.decode(response.body));
    }
    else {
      throw Exception('Failed to load jobs from API');
    }
  }

  Future<SuccessForPost> VisaApprovalPost(VisaApprovalData data) async {
    getUserID();
    await new Future.delayed(const Duration(milliseconds: 1000));
    //then it will get data
    print("fetch from apiprovider");
    final response = await client.get("${GlobalConfiguration().getString('api_base_url2')}"+"ApproveVisa?Uid="+userID.toString()
        +"&Rid="+data.Rid.toString()
        +"&Status="+data.status.toString());

    if (response.statusCode == 200) {

      //List<dynamic> values = new List<dynamic>();

      //values = json.decode(response.body);
      debugPrint("From singleGet Class:: "+json.decode(response.body).toString());
      return SuccessForPost.fromJson(json.decode(response.body));
    }
    else {
      throw Exception('Failed to load jobs from API');
    }
  }

  Future<SuccessForPost> InsuranceApprovalPost(InsuranceApprovaldata data) async {
    getUserID();
    await new Future.delayed(const Duration(milliseconds: 1000));
    //then it will get data
    print("fetch from apiprovider");
    final response = await client.get("${GlobalConfiguration().getString('api_base_url2')}"+"ApproveInsurance?Uid="+userID.toString()
        +"&Rid="+data.Rid.toString()
        +"&Status="+data.status.toString());

    if (response.statusCode == 200) {

      //List<dynamic> values = new List<dynamic>();

      //values = json.decode(response.body);
      debugPrint("From singleGet Class:: "+json.decode(response.body).toString());
      return SuccessForPost.fromJson(json.decode(response.body));
    }
    else {
      throw Exception('Failed to load jobs from API');
    }
  }
}