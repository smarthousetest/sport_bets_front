class UserModel {
  int? sub;
  String? username;
  String? email;
  String? role;
  String? subscriptionExpiresUtc;
  int? iat;
  int? exp;

  UserModel(
      {this.sub,
      this.username,
      this.email,
      this.role,
      this.subscriptionExpiresUtc,
      this.iat,
      this.exp});

  UserModel.fromJson(Map<String, dynamic> json) {
    sub = json['sub'];
    username = json['username'];
    email = json['email'];
    role = json['role'];
    subscriptionExpiresUtc = json['subscriptionExpiresUtc'];
    iat = json['iat'];
    exp = json['exp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub'] = this.sub;
    data['username'] = this.username;
    data['email'] = this.email;
    data['role'] = this.role;
    data['subscriptionExpiresUtc'] = this.subscriptionExpiresUtc;
    data['iat'] = this.iat;
    data['exp'] = this.exp;
    return data;
  }
}
