import 'package:hrm_app/models/Notification_Model.dart';
import 'package:hrm_app/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class home_bloc{

  final _repository = Repository();

  final _notificationdataFetcher = PublishSubject<List<Notification_Model>>();

  Stream<List<Notification_Model>> get allNotificationData => _notificationdataFetcher.stream;


  fetchAllNotificationdata() async{
    List<Notification_Model> notificationfetch = await _repository.fetchAllNotificationdata();
    _notificationdataFetcher.sink.add(notificationfetch);
  }

   void dispose() async{

    await _notificationdataFetcher.drain();
    _notificationdataFetcher.close();

  }


}

final homebloc = home_bloc();
