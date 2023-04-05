class GetPaymentModel {
  String? paymentId;
  String? paymentStatus;
  String? confirmationUrl;

  GetPaymentModel(
      {required this.paymentId,
      required this.paymentStatus,
      this.confirmationUrl});

  GetPaymentModel.fromJson(Map<String, dynamic> json) {
    paymentId = json['paymentId'];
    paymentStatus = json['paymentStatus'];
    confirmationUrl = json['confirmationUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['paymentId'] = this.paymentId;
    data['paymentStatus'] = this.paymentStatus;
    data['confirmationUrl'] = this.confirmationUrl;
    return data;
  }
}

class PaymentStatusModel {
  String? paymentId;
  String? paymentStatus;

  PaymentStatusModel({this.paymentId, this.paymentStatus});

  PaymentStatusModel.fromJson(Map<String, dynamic> json) {
    paymentId = json['paymentId'];
    paymentStatus = json['paymentStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['paymentId'] = this.paymentId;
    data['paymentStatus'] = this.paymentStatus;
    return data;
  }
}
