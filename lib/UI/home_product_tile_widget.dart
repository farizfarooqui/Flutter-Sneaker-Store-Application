import 'package:flutter/material.dart';
import 'package:sneaker_shop/BLOC/HomeBloc/bloc/home_bloc.dart';
import 'package:sneaker_shop/DATA/favourites_list.dart';
import 'package:sneaker_shop/MODEL/Product_model.dart';

class ProductTileCustomWidget extends StatefulWidget {
  final SneakerDataModel sneakerDataModel;
  final HomeBloc homeBloc;
  const ProductTileCustomWidget(
      {super.key, required this.sneakerDataModel, required this.homeBloc});

  @override
  State<ProductTileCustomWidget> createState() =>
      _ProductTileCustomWidgetState();
}

class _ProductTileCustomWidgetState extends State<ProductTileCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 3,
        child: Stack(
          children: [
            Image.asset(
              width: double.maxFinite,
              height: double.maxFinite,
              widget.sneakerDataModel.imageUrl,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.sneakerDataModel.brand),
                  Text(widget.sneakerDataModel.model),
                ],
              ),
            ),
            Positioned(
                right: 2,
                child: IconButton(
                    onPressed: () {
                      widget.homeBloc.add(AddToFavEvent(
                          clickedProduct: widget.sneakerDataModel));
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: favouriteList.any(
                              (item) => item.id == widget.sneakerDataModel.id)
                          ? Colors.red
                          : Colors.grey,
                    ))),
            Positioned(
                bottom: 2,
                right: 2,
                child: IconButton(
                    onPressed: () {
                      widget.homeBloc.add(AddToCartEvent(
                          clickedProduct: widget.sneakerDataModel));
                    },
                    icon: const Icon(Icons.shopping_bag_outlined))),
            Positioned(
                left: 5,
                bottom: 5,
                child: Text(' \$ ${widget.sneakerDataModel.price.toString()}')),
          ],
        ),
      ),
    );
  }
}
