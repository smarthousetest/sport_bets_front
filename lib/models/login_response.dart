class LoginResponse {
  String? accessToken;
  LoginResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
  }
}
