import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getapp1/model/second_model.dart';
import 'package:getapp1/repo/home_repo.dart';
part 'second_state.dart';

class SecondCubit extends Cubit<SecondState> {
  SecondCubit() : super(SecondInital());
  final HomeRepo homeRepo = HomeRepo();
  void secondData()async{
    try{
      emit(SecondLoading());
      var data=await homeRepo.SecondData();
      data.fold((error){
        emit(SecondError(errorMessage: e.toString()));
      },(data){
        emit(SecondLoaded(secondModel: data));
      }
      );
    }
    catch(e){
      emit(SecondError(errorMessage: "Error"));
    }
  }
}
