import 'package:hrm_app/models/InsuranceSubmit_Model.dart';
import 'package:hrm_app/models/LeaveRequestSubmit_Model.dart';
import 'package:hrm_app/models/LeaveSummery_Mode.dart';
import 'package:hrm_app/models/LeaveTypeCategory_Model.dart';
import 'package:hrm_app/models/VisaSubmit_Model.dart';
import 'package:hrm_app/models/success_for_post.dart';
import 'package:hrm_app/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class leave_request_bloc{

  final _repository = Repository();

  final _leavetypedataFetcher = PublishSubject<List<LeaveType_Model>>();

  Stream<List<LeaveType_Model>> get allLeaveTypeData => _leavetypedataFetcher.stream;

  final _leavesummerydataFetcher = PublishSubject<List<LeaveSummery_Model>>();

  Stream<List<LeaveSummery_Model>> get allLeaveSummeryData => _leavesummerydataFetcher.stream;


  final _successdataFetcher = PublishSubject<SuccessForPost>();

  Stream<SuccessForPost> get getsuccessdata => _successdataFetcher.stream;


  fetchAllLeaveTypedata() async{
    List<LeaveType_Model> leavetypefetch = await _repository.fetchAllLeaveTypedata();
    _leavetypedataFetcher.sink.add(leavetypefetch);
  }


  fetchAllLeaveSummerydata() async{
    List<LeaveSummery_Model> leavesummeryfetch = await _repository.fetchAllLeaveSummerydata();
    _leavesummerydataFetcher.sink.add(leavesummeryfetch);
  }

  CreateLeavePost(LeaveRequestData data) async{

    print("Leave Type ID is : "+ data.LeaveType.toString());

    SuccessForPost createLeave = await _repository.CreateLeavePost(data);
    _successdataFetcher.sink.add(createLeave);
  }

  CreateVisaPost(VisaSubmit data) async{

    print("Leave Type ID is : "+ data.IssueDate.toString());

    SuccessForPost createVisa = await _repository.CreateVisaPost(data);
    _successdataFetcher.sink.add(createVisa);
  }

  CreateInsurancePost(InsuranceSubmit data) async{

    print("Leave Type ID is : "+ data.expireDate.toString());

    SuccessForPost createInsurance = await _repository.CreateInsurancePost(data);
    _successdataFetcher.sink.add(createInsurance);
  }

  //CreateVisaPost

  void dispose() async{

    await _leavetypedataFetcher.drain();
    _leavetypedataFetcher.close();

    await _leavesummerydataFetcher.drain();
    _leavesummerydataFetcher.close();

    await _successdataFetcher.drain();
    _successdataFetcher.close();

  }


}

final leaverequestbloc = leave_request_bloc();
