class SubModel {
  int? subscriptionInfoId;
  int? subscriptionDurationInDays;
  String? subscriptionPrice;

  SubModel(
      {this.subscriptionInfoId,
      this.subscriptionDurationInDays,
      this.subscriptionPrice});

  SubModel.fromJson(Map<String, dynamic> json) {
    subscriptionInfoId = json['subscriptionInfoId'];
    subscriptionDurationInDays = json['subscriptionDurationInDays'];
    subscriptionPrice = json['subscriptionPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subscriptionInfoId'] = this.subscriptionInfoId;
    data['subscriptionDurationInDays'] = this.subscriptionDurationInDays;
    data['subscriptionPrice'] = this.subscriptionPrice;
    return data;
  }
}
