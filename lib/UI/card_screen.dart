import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_shop/BLOC/CartBloc/bloc/cart_bloc.dart';
import 'package:sneaker_shop/DATA/cart_list.dart';
import 'package:sneaker_shop/MODEL/Product_model.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  final CartBloc cartBloc = CartBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Card Items'),
        ),
        body: BlocConsumer<CartBloc, CartState>(
          bloc: cartBloc,
          listenWhen: (previous, current) => current is CartActionState,
          buildWhen: (previous, current) => current is! CartActionState,
          listener: (context, state) {
            if (state is ProceedToPaymentStateActionState) {
              //navigate to patment screen
            }
          },
          builder: (context, state) {
            if (state is CardEmptyState) {
              return const Center(child: Text('Your Cart is currently empty'));
            } else if (state is CardLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CardSuccessState) {
              return ListView.builder(
                  itemCount: cartList.length,
                  itemBuilder: (context, index) {
                    var cardItem = cartList[index];
                    return Card(
                      elevation: 4,
                      child: Row(children: [
                        Expanded(
                            flex: 2, child: Image.asset(cardItem.imageUrl)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(cardItem.brand),
                            Text(cardItem.model),
                            Text(cardItem.description),
                          ],
                        )
                      ]),
                    );
                  });
            } else {
              return const Center(child: Text('Erorr Occurred'));
            }
          },
        ));
  }
}
