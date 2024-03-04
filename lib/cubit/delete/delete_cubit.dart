// ignore: unused_import
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getapp1/model/three_model.dart';
import 'package:getapp1/repo/home_repo.dart';
part 'delete_state.dart';


class DeleteCubit extends Cubit<DeleteState> {
  DeleteCubit() : super(DeleteIntal(ThreeModel()));
  final HomeRepo homeRepo = HomeRepo();

  void deleteData({int? id}) async {
    emit(DeleteLoading(ThreeModel()));

    // emit(DeleteLoaded(ThreeModel()));
    var response = await homeRepo.deleteData(id)
;
    response.fold((error) {
      emit(DeleteError(
        error.message,
        ThreeModel(),
      ));
    }, (data) {
      emit(DeleteLoaded(ThreeModel()));
    });
  }
}