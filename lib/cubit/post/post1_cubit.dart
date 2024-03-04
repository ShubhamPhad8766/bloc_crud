// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getapp1/model/post_one.dart';
import 'package:getapp1/repo/home_repo.dart';
part 'post1_state.dart';

class PostOneCubit extends Cubit<PostOneState> {
  PostOneCubit() : super(PostOneInital(PostOneModel()));
  final HomeRepo homeRepo = HomeRepo();
  void postOneData([int? id]) async {
    emit(PostOneLoading(PostOneModel()));
    var data = {
      'id': id,
    };
    print('id is= $id');
    var response = await homeRepo.postOneData(data);

    response.fold((error) {
      emit(PostOneError(error.message, PostOneModel()));
    }, (postdata) {
      emit(PostOneLoaded(postdata));
      emit(PostOneSuccess(PostOneModel()));
    });
  }
}
