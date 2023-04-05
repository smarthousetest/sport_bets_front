import 'package:bet_app/models/bet_model.dart';

abstract class BetCubitState {}

class NoBetState extends BetCubitState {}

class BetLoading extends BetCubitState {}

class BetLoaded extends BetCubitState {
  BetsModel? betModel;
  BetLoaded({this.betModel});
  BetLoaded copyWith({BetsModel? betModel}) {
    return BetLoaded(betModel: betModel ?? this.betModel);
  }

  @override
  Object? get props => [betModel];
}

class BetIsEmpty extends BetCubitState {}

class AdminState {}
