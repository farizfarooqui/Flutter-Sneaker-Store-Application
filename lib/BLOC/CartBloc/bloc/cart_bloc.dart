import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sneaker_shop/DATA/cart_list.dart';
import 'package:sneaker_shop/MODEL/Product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<RemoveFromCartListEvent>(removeFromCartListEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) async {
    emit(CardLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    if (cartList.isEmpty) {
      print('empty cart page');
      return emit(CardEmptyState());
    } else {
      print('success cart page');
      emit(CardSuccessState(cartItems: cartList));
    }
  }

  FutureOr<void> removeFromCartListEvent(
      RemoveFromCartListEvent event, Emitter<CartState> emit) {
    cartList.remove(event.sneakerDataModel);
    if (cartList.isEmpty) {
      emit(CardEmptyState());
    } else {
      emit(CardSuccessState(cartItems: cartList));
    }
  }
}
