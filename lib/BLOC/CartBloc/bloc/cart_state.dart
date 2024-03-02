part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {}

class CartInitialState extends CartState {}

class CardLoadingState extends CartState {}

class CardEmptyState extends CartState {}

class CardSuccessState extends CartState {
  final List<SneakerDataModel> cartItems;

  CardSuccessState({required this.cartItems});
}

class ProceedToPaymentStateActionState extends CartActionState {}
