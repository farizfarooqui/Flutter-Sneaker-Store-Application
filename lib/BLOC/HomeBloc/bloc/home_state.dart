part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitialLoading extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<SneakerDataModel> sneaker;

  HomeSuccessState({required this.sneaker});
}

class HomeErrorState extends HomeState {}

class FavIconHomeBuildState extends HomeState {}

class FavRedIconHomeBuildState extends HomeState {}

class FavPageNavigateActionState extends HomeActionState {}

class CartPageNavigateActionState extends HomeActionState {}
