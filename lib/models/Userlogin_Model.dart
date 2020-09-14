class UserLogin_model{


  bool LogStatus;
  String UserId;
  String Password;
  String Name;
  String Company;
  String Designation;
  String Date;
  String PresentStatus;
  String LateStatus;
  String Intimes;
  String MonthPresent;
  String MonthAbesnt;
  String MonthLeave;
  String MonthLate;


  UserLogin_model({this.LogStatus, this.UserId,this.Password,this.Name,this.Company,this.Designation,this.Date,
  this.PresentStatus,this.LateStatus,this.Intimes,this.MonthPresent,this.MonthAbesnt,this.MonthLeave,this.MonthLate});

  factory UserLogin_model.fromJson(Map<String, dynamic> json) {
    return UserLogin_model(
      LogStatus: json['LogStatus'],
      UserId: json['UserId']==null ? "1" : json['UserId'],
      Password: json['Password']=="null" ? "N/A": json['Password'],
      Name: json['Name'] == null ? "Test" : json['Name'],
      Company: json["Company"] == null ? "ABC" : json["Company"],
      Designation: json['Designation'] == null? "Admin" : json['Designation'],
      Date: json["Date"] == null? "13/09/2020" : json["Date"],
      PresentStatus: json['PresentStatus'] == null ? "Present" : json['PresentStatus'],
      LateStatus: json["LateStatus"] == null ? "0" : json["LateStatus"],
      Intimes: json['Intimes'] == null ? "09:00:00" :json['Intimes'] ,
      MonthPresent: json["MonthPresent"] == null ? "15" : json["MonthPresent"],
      MonthAbesnt: json["MonthAbesnt"] == null ? "15" : json["MonthAbesnt"],
      MonthLeave: json['MonthLeave'] == null ? "15" : json['MonthLeave'],
      MonthLate: json["MonthLate"] == null ? "15" : json["MonthLate"],
    );
  }

}