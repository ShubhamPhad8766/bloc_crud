// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

part of 'post1_cubit.dart';

abstract class PostOneState {
  final PostOneModel? data;
  PostOneState(this.data);
}

class PostOneInital extends PostOneState {
  PostOneInital(
    super.PostOneModel,
  );
}

class PostOneLoading extends PostOneState {
  PostOneLoading(super.PostOneModel);
  List<Object?> get props => [];
}

class PostOneLoaded extends PostOneState {
  PostOneLoaded(super.PostOneModel);
  List<Object?> get props => [super.data];
}

class PostOneError extends PostOneState {
  final String? errorMessage;
  PostOneError(this.errorMessage, super.PostOneModel);
  List<Object?> get props => [];
}

class PostOneSuccess extends PostOneState {
  PostOneSuccess(super.PostOneModel);
}
