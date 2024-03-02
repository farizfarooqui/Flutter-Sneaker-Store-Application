import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocConsumer<FavouriteBloc, FavouriteState>(
      bloc: FavouriteBloc(),
      listenWhen: (previous, current) => current is FavouriteActionState,
      buildWhen: (previous, current) => current is! FavouriteActionState,
      listener: (context, state) {},
      builder: (context, state) {
        // if (state is FavouriteInitial) {
        //   return Scaffold(
        //     appBar: AppBar(title: const Text('My favourites')),
        //     body: const Center(child: CircularProgressIndicator()),
        //   );
        // }
         if (state is FavouriteSucessState) {
          return Text('yes');
        } else {
          return Container();
        }
      },
    );
  }
}
