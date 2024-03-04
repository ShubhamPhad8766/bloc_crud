part of 'delete_cubit.dart';
abstract class DeleteState {
  final ThreeModel? data;
  DeleteState(this.data);
}

class DeleteIntal extends DeleteState {
  DeleteIntal(super.deleteModel);
  List<Object?> get props => [];
}

class DeleteLoaded extends DeleteState {
  DeleteLoaded(super.data);
  List<Object?> get props => [data];
}

class DeleteLoading extends DeleteState {
  DeleteLoading(super.deleteModel);
  List<Object?> get props => [];
}

class DeleteError extends DeleteState {
  final String? errorMessage;
  DeleteError(this.errorMessage, super.deleteModel);
  List<Object?> get props => [];
}