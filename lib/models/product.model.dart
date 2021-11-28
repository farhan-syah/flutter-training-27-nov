class Product {
  final String id;
  final String name;
  final String description;
  final int price;
  final bool isNew;
  final String imagePath;
  final double rating;
  final int reviewCount;
  int quantity = 0;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.isNew,
    required this.imagePath,
    required this.rating,
    required this.reviewCount,
  });
}
