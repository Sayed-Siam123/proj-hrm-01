import 'package:hrm_app/models/InsuranceApprovalUPDATEdata_model.dart';
import 'package:hrm_app/models/InsuranceType_Model.dart';
import 'package:hrm_app/models/LeaveApprovalUPDATEdata_model.dart';
import 'package:hrm_app/models/LeaveRequestSubmit_Model.dart';
import 'package:hrm_app/models/LeaveSummery_Mode.dart';
import 'package:hrm_app/models/LeaveTypeCategory_Model.dart';
import 'package:hrm_app/models/LeaveType_Model.dart';
import 'package:hrm_app/models/VisaApprovalUPDATEdata_model.dart';
import 'package:hrm_app/models/VisaType_Model.dart';
import 'package:hrm_app/models/success_for_post.dart';
import 'package:hrm_app/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class Approval_Bloc{

  final _repository = Repository();

  final _leaveapprovaldataFetcher = PublishSubject<List<LeaveType_Approve>>();

  Stream<List<LeaveType_Approve>> get allLeaveApprovalData => _leaveapprovaldataFetcher.stream;

  final _visaapprovaldataFetcher = PublishSubject<List<VisaType_Approve>>();

  Stream<List<VisaType_Approve>> get allVisaApprovalData => _visaapprovaldataFetcher.stream;

  final _insuranceapprovaldataFetcher = PublishSubject<List<InsuranceType_Approve>>();

  Stream<List<InsuranceType_Approve>> get allInsuranceApprovalData => _insuranceapprovaldataFetcher.stream;

  final _successdataFetcher = PublishSubject<SuccessForPost>();

  Stream<SuccessForPost> get getsuccessdata => _successdataFetcher.stream;

  fetchAllLeaveApprovaldata() async{
    List<LeaveType_Approve> leavetypefetch = await _repository.fetchAllLeaveApprovaldata();
    _leaveapprovaldataFetcher.sink.add(leavetypefetch);
  }

  fetchAllVisaApprovaldata() async{
    List<VisaType_Approve> visatypefetch = await _repository.fetchAllVisaApprovaldata();
    _visaapprovaldataFetcher.sink.add(visatypefetch);
  }

  fetchAllInsuranceApprovaldata() async{
    List<InsuranceType_Approve> insurancetypefetch = await _repository.fetchAllInsuranceApprovaldata();
    _insuranceapprovaldataFetcher.sink.add(insurancetypefetch);
  }

  LeaveApprovalPost(LeaveApprovalData data) async{

    print("Leave Type ID is : "+ data.Rid.toString());

    SuccessForPost createLeave = await _repository.LeaveApprovalPost(data);
    _successdataFetcher.sink.add(createLeave);
  }


  VisaApprovalPost(VisaApprovalData data) async{

    print("Leave Type ID is : "+ data.Rid.toString());

    SuccessForPost createLeave = await _repository.VisaApprovalPost(data);
    _successdataFetcher.sink.add(createLeave);
  }

  InsuranceApprovalPost(InsuranceApprovaldata data) async{

    print("Leave Type ID is : "+ data.Rid.toString());

    SuccessForPost createLeave = await _repository.InsuranceApprovalPost(data);
    _successdataFetcher.sink.add(createLeave);
  }


  void dispose() async{

    await _leaveapprovaldataFetcher.drain();
    _leaveapprovaldataFetcher.close();

    await _visaapprovaldataFetcher.drain();
    _visaapprovaldataFetcher.close();

    await _insuranceapprovaldataFetcher.drain();
    _insuranceapprovaldataFetcher.close();

    await _successdataFetcher.drain();
    _successdataFetcher.close();

  }
}

final approvalbloc = Approval_Bloc();
