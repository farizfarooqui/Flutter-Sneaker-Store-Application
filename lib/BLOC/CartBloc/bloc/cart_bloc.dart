import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sneaker_shop/DATA/cart_list.dart';
import 'package:sneaker_shop/MODEL/Product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<CartInitialEvent>(cartInitialEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) async {
    emit(CardLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    if (cartList.isEmpty) {
      emit(CardEmptyState());
    } else {
      emit(CardSuccessState());
    }
  }
}
