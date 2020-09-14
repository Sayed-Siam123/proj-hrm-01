import 'package:hrm_app/models/Userlogin_Model.dart';
import 'package:hrm_app/resources/SharedPrefer.dart';
import 'package:hrm_app/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class user_bloc {
  final _repository = Repository();
  SessionManager prefs = SessionManager();

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
  
  
  // ignore: close_sinks
  final Uid = BehaviorSubject<String>();

  // ignore: close_sinks
  final Upas = BehaviorSubject<String>();

  // ignore: close_sinks
  final loginsuccess = BehaviorSubject<String>();

  final _LoginSuccessFetcher = PublishSubject<UserLogin_model>();

  Function(String) get getuser_id => Uid.sink.add;

  Function(String) get getUser_pass => Upas.sink.add;

  Function(String) get getsuccess => loginsuccess.sink.add;

  Stream<UserLogin_model> get LoginSuccessData => _LoginSuccessFetcher.stream;

  userlogin(UserLogin_model data) async {
    print("data:: " + data.UserId.toString() + " " + data.Password.toString());
    UserLogin_model success = await _repository.userlogin(data.UserId.toString(),data.Password.toString());
    _LoginSuccessFetcher.sink.add(success);
  }

  void dispose() async {
    Uid.drain();
    Uid.value = null;
    Upas.drain();
    Upas.value = null;
    loginsuccess.drain();
    loginsuccess.value = null;

    await _LoginSuccessFetcher.drain();
    await _LoginSuccessFetcher.close();
  }
}

final userbloc = user_bloc();
