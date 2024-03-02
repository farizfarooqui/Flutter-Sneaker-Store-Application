import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_shop/BLOC/CartBloc/bloc/cart_bloc.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final CartBloc cartBloc = CartBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      bloc: CartBloc(),
      listenWhen: (previous, current) => current is CartActionState,
      buildWhen: (previous, current) => current is! CartActionState,
      listener: (context, state) {
        if (state is ProceedToPaymentStateActionState) {
          //navigate to patment screen
        }
      },
      builder: (context, state) {
        if (state is CartInitialState) {
          return Scaffold(
            appBar: AppBar(),
            body: const Center(child: Text('CartInitialState')),
          );
        } else if (state is CardLoadingState) {
          return Scaffold(
            appBar: AppBar(),
            body: const Center(child: Text('CardLoadingState')),
          );
        } else if (state is CardSuccessState) {
          return Scaffold(
            appBar: AppBar(),
            body: const Center(child: Text('CardSuccessState')),
          );
        } else {
          return Scaffold(
            appBar: AppBar(),
            body: const Center(child: Text('else')),
          );
        }
      },
    );
  }
}
