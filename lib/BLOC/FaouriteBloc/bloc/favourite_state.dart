part of 'favourite_bloc.dart';

@immutable
abstract class FavouriteState {}

abstract class FavouriteActionState extends FavouriteState {}

class FavouriteInitial extends FavouriteState {}

class FavouriteSucessState extends FavouriteState {}

class FavLoadingState extends FavouriteState {}

class FavEmptyState extends FavouriteState {}
