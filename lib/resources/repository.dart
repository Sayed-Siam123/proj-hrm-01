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
import 'package:hrm_app/resources/apiprovider.dart';

class Repository{

  final apiprovider = ApiProvider();



  Future<UserLogin_model> userlogin(String Uid,String Upas) => apiprovider.userlogin(Uid,Upas);

  Future<List<Notification_Model>> fetchAllNotificationdata() => apiprovider.fetchAllNotificationdata();
  Future<List<LeaveType_Model>> fetchAllLeaveTypedata() => apiprovider.fetchAllLeaveTypedata();
  Future<List<LeaveSummery_Model>> fetchAllLeaveSummerydata() => apiprovider.fetchAllLeaveSummerydata();
  Future<List<LeaveType_Approve>> fetchAllLeaveApprovaldata() => apiprovider.fetchAllLeaveApprovaldata();
  Future<List<VisaType_Approve>> fetchAllVisaApprovaldata() => apiprovider.fetchAllVisaApprovaldata();
  Future<List<InsuranceType_Approve>> fetchAllInsuranceApprovaldata() => apiprovider.fetchAllInsuranceApprovaldata();


  Future<SuccessForPost> CreateLeavePost(LeaveRequestData data) => apiprovider.CreateLeavePost(data);
  Future<SuccessForPost> CreateVisaPost(VisaSubmit data) => apiprovider.CreateVisaPost(data);
  Future<SuccessForPost> CreateInsurancePost(InsuranceSubmit data) => apiprovider.CreateInsurancePost(data);


  Future<SuccessForPost> LeaveApprovalPost(LeaveApprovalData data) => apiprovider.LeaveApprovalPost(data);
  Future<SuccessForPost> VisaApprovalPost(VisaApprovalData data) => apiprovider.VisaApprovalPost(data);
  Future<SuccessForPost> InsuranceApprovalPost(InsuranceApprovaldata data) => apiprovider.InsuranceApprovalPost(data);


  //fetchAllVisaApprovaldata

}