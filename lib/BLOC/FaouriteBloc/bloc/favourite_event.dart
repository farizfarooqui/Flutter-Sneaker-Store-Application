part of 'favourite_bloc.dart';

@immutable
abstract class FavouriteEvent {}

class FavouriteInitialEvent extends FavouriteEvent {}

class RemoveFromFavListEvent extends FavouriteEvent {
  final SneakerDataModel sneakerDataModel;

  RemoveFromFavListEvent({required this.sneakerDataModel});
}
