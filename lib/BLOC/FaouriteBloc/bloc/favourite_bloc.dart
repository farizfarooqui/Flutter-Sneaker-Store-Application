import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sneaker_shop/DATA/favourites_list.dart';
import 'package:sneaker_shop/MODEL/Product_model.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(FavouriteInitial()) {
    on<FavouriteInitialEvent>(favouriteInitialEvent);
    on<RemoveFromFavListEvent>(removeFromFavListEvent);
  }

  FutureOr<void> favouriteInitialEvent(
      FavouriteInitialEvent event, Emitter<FavouriteState> emit) async {
    emit(FavLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    if (favouriteList.isEmpty) {
      return emit(FavEmptyState());
    } else {
      return emit(FavouriteSucessState());
    }
  }

  FutureOr<void> removeFromFavListEvent(
      RemoveFromFavListEvent event, Emitter<FavouriteState> emit) {
    favouriteList.remove(event.sneakerDataModel);
    if (favouriteList.isEmpty) {
      emit(FavEmptyState());
    } else {
      emit(FavouriteSucessState());
    }
  }
}
