import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_shop/DATA/data.dart';
import 'package:sneaker_shop/DATA/favourites_list.dart';
import 'package:sneaker_shop/MODEL/Product_model.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialLoading()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<NavigateToFavListEvent>(navigateToFavListEvent);
    on<NavigateToCartListEvent>(navigateToCartListEvent);
    on<AddToFavEvent>(addToFavEvent);
  }
  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeInitialLoading());
    print('loading');
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeSuccessState(
        sneaker: StoreItems.storeItems
            .map((e) => SneakerDataModel(
                id: e['id'],
                brand: e['brand'],
                model: e['model'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()));
    print('Success');
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

  FutureOr<void> addToFavEvent(AddToFavEvent event, Emitter<HomeState> emit) {
    print('add to fav list');
    favouriteList.add(event.clickedProduct);
    print(favouriteList);
  }
}
