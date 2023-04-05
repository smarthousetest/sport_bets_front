import 'package:bet_app/models/sub_model.dart';
import 'package:bet_app/screens/subscription_screen/sub_state.dart';
import 'package:bet_app/server/api/api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/auth_cubit.dart';

class SubCubit extends Cubit<SubState> {
  SubCubit() : super(SubEmptyState());

  Future getSub() async {
    emit(SubLoading());
    String? token = await storage.read(key: 'key');
    List<SubModel>? subModel = await Api().getSubs(token!);
    emit(SubLoaded(subModel: subModel!));
  }

  Future addSub(int days, int price) async {
    String? token = await storage.read(key: 'key');
    await Api().addSub(days: days, price: price, token: token!);
  }
}
