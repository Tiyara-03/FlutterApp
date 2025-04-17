import 'package:flutter/material.dart';
import 'package:kisan/data/products.dart'; // using your product/crop data
import 'package:kisan/widgits/products_card1.dart'; // using the full-width card design

class Crop extends StatelessWidget {
  const Crop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Crops Available")),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: ProductsCard1(product: products[index]),
          );
        },
      ),
    );
  }
}
