part of 'put_cubit.dart';

abstract class PutState {
  PutModel? putModel;
  PutState({this.putModel});
}

class PutInital extends PutState {
  PutInital({super.putModel});
}

class PutLoading extends PutState {
  PutLoading({super.putModel});
}

class PutLoaded extends PutState {
  PutLoaded({super.putModel});
}

class PutError extends PutState {
  final String? errorMessage;
  PutError({this.errorMessage});
}

class PutSucces extends PutState {
  PutSucces({super.putModel});
}
