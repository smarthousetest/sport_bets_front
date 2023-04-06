class BetsModel {
  List<BetModel>? unfinishedAdvices;
  List<BetModel>? history;

  BetsModel({this.unfinishedAdvices, this.history});

  BetsModel.fromJson(Map<String, dynamic> json) {
    if (json['unfinishedAdvices'] != null) {
      unfinishedAdvices = <BetModel>[];
      json['unfinishedAdvices'].forEach((v) {
        unfinishedAdvices!.add(new BetModel.fromJson(v));
      });
    }
    if (json['history'] != null) {
      history = <BetModel>[];
      json['history'].forEach((v) {
        history!.add(new BetModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.unfinishedAdvices != null) {
      data['unfinishedAdvices'] =
          this.unfinishedAdvices!.map((v) => v.toJson()).toList();
    }
    if (this.history != null) {
      data['history'] = this.history!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BetModel {
  int? bettingAdviceId;
  String? sportType;
  String? league;
  String? teamFirst;
  String? teamSecond;
  int? bettingOdds;
  int? probability;
  String? bet;
  String? comment;
  bool? betSuccessful;
  String? country;
  String? matchBeginning;

  BetModel(
      {this.bettingAdviceId,
      this.sportType,
      this.league,
      this.teamFirst,
      this.teamSecond,
      this.bettingOdds,
      this.probability,
      this.bet,
      this.comment,
      this.betSuccessful,
      this.country,
      this.matchBeginning});

  BetModel.fromJson(Map<String, dynamic> json) {
    bettingAdviceId = json['bettingAdviceId'];
    sportType = json['sportType'];
    league = json['league'];
    teamFirst = json['teamFirst'];
    teamSecond = json['teamSecond'];
    bettingOdds = json['bettingOdds'];
    probability = json['probability'];
    bet = json['bet'];
    comment = json['comment'];
    betSuccessful = json['betSuccessful'];
    country = json['country'];
    matchBeginning = json['matchBeginning'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bettingAdviceId'] = this.bettingAdviceId;
    data['sportType'] = this.sportType;
    data['league'] = this.league;
    data['teamFirst'] = this.teamFirst;
    data['teamSecond'] = this.teamSecond;
    data['bettingOdds'] = this.bettingOdds;
    data['probability'] = this.probability;
    data['bet'] = this.bet;
    data['comment'] = this.comment;
    data['betSuccessful'] = this.betSuccessful;
    data['country'] = this.country;
    data['matchBeginning'] = this.matchBeginning;
    return data;
  }
}
