class BetModel {
  String? sportType;
  String? league;
  String? teamFirst;
  String? teamSecond;
  String? bettingOdds;
  String? probability;
  String? bet;
  String? comment;
  int? bettingAdviceId;
  bool? betSuccessful;

  BetModel(
      {this.sportType,
      this.league,
      this.teamFirst,
      this.teamSecond,
      this.bettingOdds,
      this.probability,
      this.bet,
      this.comment,
      this.bettingAdviceId,
      this.betSuccessful});

  BetModel.fromJson(Map<String, dynamic> json) {
    sportType = json['sportType'];
    league = json['league'];
    teamFirst = json['teamFirst'];
    teamSecond = json['teamSecond'];
    bettingOdds = json['bettingOdds'];
    probability = json['probability'];
    bet = json['bet'];
    comment = json['comment'];
    bettingAdviceId = json['bettingAdviceId'];
    betSuccessful = json['betSuccessful'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sportType'] = this.sportType;
    data['league'] = this.league;
    data['teamFirst'] = this.teamFirst;
    data['teamSecond'] = this.teamSecond;
    data['bettingOdds'] = this.bettingOdds;
    data['probability'] = this.probability;
    data['bet'] = this.bet;
    data['comment'] = this.comment;
    data['bettingAdviceId'] = this.bettingAdviceId;
    data['betSuccessful'] = this.betSuccessful;
    return data;
  }
}
