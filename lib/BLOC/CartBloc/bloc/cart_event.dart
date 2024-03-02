part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent {
  final SneakerDataModel clickedProduct;

  CartInitialEvent({required this.clickedProduct});
}

class RemoveFromCartListEvent extends CartEvent {}

class ProceedToPaymentEvent extends CartEvent {}
