part of 'home_cubit.dart';

abstract class HomeState {
  HomeModel? homeModel;
  HomeState({this.homeModel});
}

class HomeIntial extends HomeState {
  HomeIntial({super.homeModel});
}

class HomeLoading extends HomeState {
  HomeLoading({super.homeModel});
}

class HomeLoaded extends HomeState {
  HomeLoaded({super.homeModel});
}

class HomeError extends HomeState {
  final String? errorMessage;
  HomeError({this.errorMessage});
}
