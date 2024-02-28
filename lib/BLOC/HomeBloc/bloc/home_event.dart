part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class AddToFavEvent extends HomeEvent {}

class AddToCartEvent extends HomeEvent {}

class NavigateToFavList extends HomeEvent {}

class NavigateToCartList extends HomeEvent {}
