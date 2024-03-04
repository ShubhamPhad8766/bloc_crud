import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getapp1/model/three_model.dart';
import 'package:getapp1/repo/home_repo.dart';
part 'three_state.dart';

class ThreeCubit extends Cubit<ThreeState> {
  ThreeCubit() : super(ThreeInital());
  final HomeRepo homeRepo = HomeRepo();
  void threeData() async {
    try {
      emit(ThreeLoading());
      var data = await homeRepo.threeData();
      // ignore: avoid_print
      print(data);
      data.fold((error) {
        emit(ThreeError(errorMeaage: e.toString()));
      }, (data) {
        emit(ThreeLoaded(threeModel: data));
      });
    } catch (e) {
      emit(ThreeError(errorMeaage: e.toString()));
    }
  }
}
