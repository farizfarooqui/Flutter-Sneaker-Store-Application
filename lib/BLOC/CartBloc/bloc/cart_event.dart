part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class RemoveFromCartListEvent extends CartEvent {}

class ProceedToPaymentEvent extends CartEvent {}
