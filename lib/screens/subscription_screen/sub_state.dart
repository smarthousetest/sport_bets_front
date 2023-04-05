import 'package:bet_app/models/sub_model.dart';

abstract class SubState {}

class SubLoaded extends SubState {
  List<SubModel> subModel;
  SubLoaded({required this.subModel});
  SubLoaded copyWith({List<SubModel>? subModel}) {
    return SubLoaded(subModel: subModel ?? this.subModel);
  }

  @override
  Object? get props => [subModel];
}

class SubLoading extends SubState {}

class SubEmptyState extends SubState {}
