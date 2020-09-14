class Notification_Model{

  String NotTitle;
  String NotDetails;

  Notification_Model({this.NotTitle, this.NotDetails});

  factory Notification_Model.fromJson(Map<String, dynamic> json) {
    return Notification_Model(
      NotTitle: json["NotTitle"],
      NotDetails: json["NotDetails"]
    );
  }

}