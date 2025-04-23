import 'package:flutter/material.dart';
import 'package:kisan/widgits/products_card1.dart';
import '../models/product.dart';

final List<Product> rentProducts = [
  Product(
    name: 'Tractor',
    image: 'assets/utility-tractor.jpg',
    unit: 'per day',
    price: 750,
    category: 'Rent',
  ),

   Product(
    name: 'Tractor',
    image: 'assets/earth.jpg',
    unit: 'per day',
    price: 750,
    category: 'Rent',
  ),
  // Add more static rentals...
];

class Rent extends StatelessWidget {
  const Rent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rentProducts.length,
      itemBuilder: (context, index) {
        return ProductsCard1(product: rentProducts[index]);
      },
    );
  }
}





