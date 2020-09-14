class LeaveSummery_Model{

  String Id;
  String LeaveType;
  String LeaveAssign;
  String LeaveEnjoyed;
  String LeaveBalance;


  LeaveSummery_Model({this.Id, this.LeaveType,this.LeaveAssign,this.LeaveEnjoyed,this.LeaveBalance});

  factory LeaveSummery_Model.fromJson(Map<String, dynamic> json) {
    return LeaveSummery_Model(
        Id: json["Id"],
        LeaveType: json["LeaveType"],
      LeaveAssign: json["LeaveAssign"],
        LeaveBalance: json["LeaveBalance"],
        LeaveEnjoyed: json["LeaveEnjoyed"],
    );
  }

}