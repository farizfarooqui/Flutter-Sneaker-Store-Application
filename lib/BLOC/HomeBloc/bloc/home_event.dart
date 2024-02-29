part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class AddToFavEvent extends HomeEvent {}

class AddToCartEvent extends HomeEvent {}

class NavigateToFavListEvent extends HomeEvent {}

class NavigateToCartListEvent extends HomeEvent {}
