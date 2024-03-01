part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeActionState {}

class HomeSuccessState extends HomeState {
  final List<SneakerDataModel> sneaker;

  HomeSuccessState({required this.sneaker});
}

class HomeErrorState extends HomeState {}

class FavPageNavigateActionState extends HomeActionState {}

class CartPageNavigateActionState extends HomeActionState {}
