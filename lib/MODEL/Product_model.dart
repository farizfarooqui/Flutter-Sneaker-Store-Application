// ignore: file_names
class SneakerDataModel {
  final int id;
  final String brand;
  final String model;
  final String description;
  final double price;
  final String imageUrl;
  bool isFav;

  SneakerDataModel({
    required this.id,
    required this.brand,
    required this.model,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFav = false,
  });
}
