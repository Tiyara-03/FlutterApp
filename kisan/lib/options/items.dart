import 'package:flutter/material.dart';
import 'package:kisan/widgits/products_card1.dart';
import '../models/product.dart';

final List<Product> itemProducts = [
  Product(
    name: 'Organic Fertilizer',
    image: 'assets/vermicompost.jpeg',
    unit: 'kg',
    price: 200,
    category: 'Item',
  ),
  Product(
    name: 'Organic Fertilizer',
    image: 'assets/sickle.jpeg',
    unit: 'kg',
    price: 200,
    category: 'Item',
  ),
  // Add more static items...
];

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemProducts.length,
      itemBuilder: (context, index) {
        return ProductsCard1(product: itemProducts[index]);
      },
    );
  }
}
