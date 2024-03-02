part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class RemoveFromCartListEvent extends CartEvent {
  final SneakerDataModel sneakerDataModel;

  RemoveFromCartListEvent({required this.sneakerDataModel});
}

class ProceedToPaymentEvent extends CartEvent {}
