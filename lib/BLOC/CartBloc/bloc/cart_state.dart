part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState {}

class CartInitialState extends CartState {}

class CardLoadingState extends CartState {}

class CardEmptyState extends CartState {}

class CardSuccessState extends CartState {}

class ProceedToPaymentStateActionState extends CartActionState {}
