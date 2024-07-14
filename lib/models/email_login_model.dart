class EmailLoginModel {
  String? loginId;
  String? name;
  String? previleges;
  String? type;
  String? orgName;

  EmailLoginModel(
      {this.loginId, this.name, this.previleges, this.type, this.orgName});

  EmailLoginModel.fromJson(Map<String, dynamic> json) {
    loginId = json['loginId'];
    name = json['name'];
    previleges = json['previleges'];
    type = json['type'];
    orgName = json['orgName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loginId'] = this.loginId;
    data['name'] = this.name;
    data['previleges'] = this.previleges;
    data['type'] = this.type;
    data['orgName'] = this.orgName;
    return data;
  }
}
