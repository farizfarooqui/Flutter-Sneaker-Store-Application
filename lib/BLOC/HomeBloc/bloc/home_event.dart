part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class NavigateToFavListEvent extends HomeEvent {}

class NavigateToCartListEvent extends HomeEvent {}

class AddToFavEvent extends HomeEvent {
  final bool isFav = !true;
  final SneakerDataModel clickedProduct;

  AddToFavEvent({required this.clickedProduct});
}

class AddToCartEvent extends HomeEvent {
  final SneakerDataModel clickedProduct;

  AddToCartEvent({required this.clickedProduct});
}
