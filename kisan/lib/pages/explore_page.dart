import 'package:flutter/material.dart';
import 'package:kisan/models/product.dart';
import 'package:kisan/options/items.dart';
import 'package:kisan/options/rent.dart';
import 'package:kisan/widgits/products_card1.dart';

// Static crop products
final List<Product> products = [
  Product(
    name: 'Onion',
    category: 'Crop',
    price: 50,
    image: 'assets/vegetable-2.jpg',
    unit: 'kg',
  ),
  Product(
    name: 'Tomato',
    category: 'Crop',
    price: 40,
    image: 'assets/vegetable-3.jpg',
    unit: 'kg',
  ),
];

// Global list to hold user-uploaded products
List<Product> userUploadedProducts = [];

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final combinedCrops = products + userUploadedProducts;

    final options = [
      CropDataList(crops: combinedCrops),
      const Items(),
      const Rent(),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => currentIndex = 0),
                  child: const Text("Crops"),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => currentIndex = 1),
                  child: const Text("Products"),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => currentIndex = 2),
                  child: const Text("Renting"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(child: options[currentIndex]),
          ],
        ),
      ),
    );
  }
}

class CropDataList extends StatelessWidget {
  final List<Product> crops;

  const CropDataList({super.key, required this.crops});

  @override
  Widget build(BuildContext context) {
    if (crops.isEmpty) {
      return const Center(child: Text("No crops to display."));
    }
    return ListView.builder(
      itemCount: crops.length,
      itemBuilder: (context, index) {
        return ProductsCard1(product: crops[index]);
      },
    );
  }
}
