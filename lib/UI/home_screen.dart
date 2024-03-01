import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_shop/BLOC/HomeBloc/bloc/home_bloc.dart';
import 'package:sneaker_shop/UI/card_screen.dart';
import 'package:sneaker_shop/UI/favourite_screen.dart';
import 'package:sneaker_shop/UI/home_product_tile_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listener: (context, state) {
        if (state is FavPageNavigateActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const FavouriteScreen()));
        }
        if (state is CartPageNavigateActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const CardScreen()));
        }
      },
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      builder: (context, state) {
        if (state is HomeInitialLoading) {
          return const Scaffold(
            body: Center(
                child: CircularProgressIndicator(
              color: Colors.greenAccent,
            )),
          );
        } else if (state is HomeSuccessState) {
          final success = state;
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {},
                icon: const CircleAvatar(child: Icon(Icons.person)),
              ),
              backgroundColor: Colors.greenAccent,
              title: const Center(child: Text("Sneaker Store")),
              actions: [
                IconButton(
                  onPressed: () {
                    homeBloc.add(NavigateToFavListEvent());
                  },
                  icon: const Icon(Icons.favorite_border),
                ),
                IconButton(
                  onPressed: () {
                    homeBloc.add(NavigateToCartListEvent());
                  },
                  icon: const Icon(Icons.shopping_bag_outlined),
                ),
              ],
            ),
            body: GridView.builder(
              itemCount: success.sneaker.length,
              itemBuilder: (context, index) {
                return ProductTileCustomWidget(
                  sneakerDataModel: success.sneaker[index],
                  homeBloc: homeBloc,
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of items in a row
                crossAxisSpacing: 10.0, // Spacing between items horizontally
                mainAxisSpacing: 10.0, // Spacing between items vertically
                childAspectRatio: 0.8, // Aspect ratio of items
              ),
            ),
            floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.message), onPressed: () {}),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text('Error 404'),
            ),
          );
        }
      },
    );
  }
}
