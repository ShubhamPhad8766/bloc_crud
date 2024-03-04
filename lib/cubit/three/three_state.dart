part of 'three_cubit.dart';
abstract class ThreeState {
  ThreeModel? threeModel;
  ThreeState({this.threeModel});
}

class ThreeInital extends ThreeState {
  ThreeInital({super.threeModel});
}

class ThreeLoading extends ThreeState {
  ThreeLoading({super.threeModel});
}

class ThreeLoaded extends ThreeState {
  ThreeLoaded({super.threeModel});
}

class ThreeError extends ThreeState {
  final String? errorMeaage;
  ThreeError({this.errorMeaage});
}
