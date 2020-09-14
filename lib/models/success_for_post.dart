class SuccessForPost{
  bool Status;
  String Messages;

  SuccessForPost({this.Status,this.Messages});

  factory SuccessForPost.fromJson(Map<String, dynamic> json) {
    return SuccessForPost(
        Status: json["Status"],
        Messages: json["Messages"]
    );
  }


}