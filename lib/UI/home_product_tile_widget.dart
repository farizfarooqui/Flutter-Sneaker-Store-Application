import 'package:flutter/material.dart';
import 'package:sneaker_shop/DATA/data.dart';
import 'package:sneaker_shop/MODEL/Product_model.dart';

class ProductTileCustomWidget extends StatefulWidget {
  final SneakerDataModel sneakerDataModel;
  const ProductTileCustomWidget({super.key, required this.sneakerDataModel});

  @override
  State<ProductTileCustomWidget> createState() =>
      _ProductTileCustomWidgetState();
}

class _ProductTileCustomWidgetState extends State<ProductTileCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Stack(
        children: [
          Image.asset(
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
                  onPressed: () {}, icon: const Icon(Icons.favorite_border))),
          Positioned(
              left: 5,
              bottom: 5,
              child: Text(widget.sneakerDataModel.price.toString())),
        ],
      ),
    );
  }
}
