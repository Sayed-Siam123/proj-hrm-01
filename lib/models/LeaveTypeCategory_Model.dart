class LeaveType_Model{

  String Id;
  String type;

  LeaveType_Model({this.Id,this.type});

  factory LeaveType_Model.fromJson(Map<String, dynamic> json) {
    return LeaveType_Model(
        Id: json["Id"],
        type: json["Value"],
    );
  }

}