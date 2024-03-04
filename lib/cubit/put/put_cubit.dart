// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getapp1/model/put_model.dart';
import 'package:getapp1/repo/home_repo.dart';

part 'put_state.dart';

class PutCubit extends Cubit<PutState> {
  PutCubit() : super(PutInital());
  final HomeRepo homerepo = HomeRepo();
  void putData(int? id, Map<String, dynamic> payload) async {
    // void putData(int? id, Map<String, dynamic> payload) async {
    try {
      emit(PutLoading());
      var data = await homerepo.putData(payload, id);
      print(state);
      print(data);
      data.fold((error) {
        emit(PutError());
      }, (data) {
        emit(PutSucces());
      });
    } catch (e) {
      emit(PutError(errorMessage: e.toString()));
    }
  }
}
