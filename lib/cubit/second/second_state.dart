part of 'second_cubit.dart';
abstract class SecondState {
  SecondModel? secondModel;
  SecondState({this.secondModel});
}

class SecondInital extends SecondState {
  SecondInital({super.secondModel});
}

class SecondLoading extends SecondState {
  SecondLoading({super.secondModel});
}

class SecondLoaded extends SecondState {
  SecondLoaded({super.secondModel});
}

class SecondError extends SecondState {
  final String? errorMessage;
  SecondError({this.errorMessage});
}
