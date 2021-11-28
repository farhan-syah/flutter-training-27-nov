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

  static Product fromMap(Map<String, dynamic> data) {
    return Product(
      id: data['id'],
      name: data['name'],
      description: data['description'],
      price: data['price'],
      isNew: data['isNew'],
      imagePath: data['imagePath'],
      rating: data['rating'],
      reviewCount: data['reviewCount'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'isNew': isNew,
      'imagePath': imagePath,
      'rating': rating,
      'reviewCount': reviewCount,
      'quantity': quantity,
    };
  }
}
