class Product {
  final String name;
  final String image; // use path or base64 in real apps
  final double price;
  final String unit;
  final String category; // 👈 NEW FIELD

  const Product({
    required this.name,
    required this.image,
    required this.price,
    required this.unit,
    required this.category,
  });
}
