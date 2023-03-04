class UserModel {
  String? username;
  String? password;
  String? role;
  UserModel({this.username, this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['role'] = this.role;
    return data;
  }
}
