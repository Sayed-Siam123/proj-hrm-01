class InsuranceType_Approve {
  String Id;
  String AppFor;
  String MainTitle;
  String Description;
  String LeaveDates;
  String RequestBy;
  String RequestDate;
  String RequestNo;
  String RequestStatus;

  InsuranceType_Approve(
      {this.Id, this.AppFor, this.MainTitle, this.Description, this.LeaveDates, this.RequestBy, this.RequestDate, this.RequestNo, this.RequestStatus});

  factory InsuranceType_Approve.fromJson(Map<String, dynamic> json) {
    return InsuranceType_Approve(
      Id: json["Id"],
      AppFor: json["AppFor"],
      MainTitle: json["MainTitle"],
      Description: json["Description"],
      LeaveDates: json["LeaveDates"],
      RequestBy: json["RequestBy"],
      RequestDate: json["RequestDate"],
      RequestNo: json["RequestNo"],
      RequestStatus: json["RequestStatus"],    //TODO:: EIKHAN THEKE KAJ
    );
  }


}