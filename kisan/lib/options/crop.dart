import 'package:flutter/material.dart';
import 'package:kisan/data/products.dart';
import 'package:kisan/widgits/products_card1.dart';
import '../models/product.dart';
import '../data/user_uploaded_products.dart';

class Crop extends StatelessWidget {
  const Crop({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> cropProducts = [
      ...products.where((p) => p.category == 'Crop'),
      ...userUploadedProducts.where((p) => p.category == 'Crop'),
    ];

    return ListView.builder(
      itemCount: cropProducts.length,
      itemBuilder: (context, index) {
        return ProductsCard1(product: cropProducts[index]);
      },
    );
  }
}
