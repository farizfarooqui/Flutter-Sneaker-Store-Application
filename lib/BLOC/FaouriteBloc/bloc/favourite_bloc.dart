import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(FavouriteSucessState()) {
    on<FavouriteInitialEvent>(favouriteInitialEvent);
  }

  FutureOr<void> favouriteInitialEvent(
      FavouriteInitialEvent event, Emitter<FavouriteState> emit) async {
    // emit(FavouriteInitial());
    // Future.delayed(const Duration(seconds: 1));
    emit(FavouriteSucessState());
  }
}
