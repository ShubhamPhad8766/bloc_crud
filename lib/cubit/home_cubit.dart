import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getapp1/repo/home_repo.dart';

import '../model/home_model.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeIntial());
  final HomeRepo homeRepo = HomeRepo();

  void getData() async {
    try {
      emit(HomeLoading());
      // ignore: unused_local_variable
      var data = await homeRepo.getData();
      data.fold((error) {
        emit(HomeError(errorMessage: error.message));
      }, (data) {
      //  getData();
        emit(HomeLoaded(homeModel: data));
      });
    } catch (e) {
      emit(HomeError(errorMessage: e.toString()));
    }
  }
}
