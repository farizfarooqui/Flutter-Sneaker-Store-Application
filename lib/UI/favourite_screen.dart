import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_shop/DATA/favourites_list.dart';

import '../BLOC/FaouriteBloc/bloc/favourite_bloc.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    favouriteBloc.add(FavouriteInitialEvent());
    super.initState();
  }

  final FavouriteBloc favouriteBloc = FavouriteBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites List')),
      body: BlocConsumer<FavouriteBloc, FavouriteState>(
        bloc: favouriteBloc,
        listenWhen: (previous, current) => current is FavouriteActionState,
        buildWhen: (previous, current) => current is! FavouriteActionState,
        listener: (context, state) {
          //Navigation
        },
        builder: (context, state) {
          if (state is FavEmptyState) {
            return const Center(
                child: Text('Your Whislist is currently empty'));
          } else if (state is FavouriteSucessState) {
            return ListView.builder(
                itemCount: favouriteList.length,
                itemBuilder: (context, index) {
                  var cardItem = favouriteList[index];
                  return Card(
                    elevation: 4,
                    child: Row(children: [
                      Expanded(flex: 2, child: Image.asset(cardItem.imageUrl)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(cardItem.brand),
                          Text(cardItem.model),
                          Text(cardItem.description),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.minimize))
                        ],
                      )
                    ]),
                  );
                });
          } else if (state is FavLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text('Error 404'));
          }
        },
      ),
    );
  }
}
