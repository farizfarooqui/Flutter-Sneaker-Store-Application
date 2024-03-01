part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class AddToFavEvent extends HomeEvent {}

class AddToCartEvent extends HomeEvent {}

class NavigateToFavListEvent extends HomeEvent {}

class NavigateToCartListEvent extends HomeEvent {}
