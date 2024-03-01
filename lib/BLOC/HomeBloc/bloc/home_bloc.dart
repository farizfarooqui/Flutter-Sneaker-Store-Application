import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<NavigateToFavListEvent>(navigateToFavListEvent);
    on<NavigateToCartListEvent>(navigateToCartListEvent);
  }

  FutureOr<void> navigateToFavListEvent(
      NavigateToFavListEvent event, Emitter<HomeState> emit) {
    print("FavList");
    emit(FavPageNavigateActionState());
  }

  FutureOr<void> navigateToCartListEvent(
      NavigateToCartListEvent event, Emitter<HomeState> emit) {
    print('CartList');
    emit(CartPageNavigateActionState());
  }
}
