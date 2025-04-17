import 'package:flutter/material.dart';
import 'package:kisan/data/products.dart';
import 'package:kisan/widgits/products_card.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Join now card
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: SizedBox(
              height: 170,
              child: Card(
                color: Colors.green.shade50,
                elevation: 0.1,
                shadowColor: Colors.green.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      // Text
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kisan Samruddhi ",
                              style: Theme.of(context).textTheme.titleLarge!
                                  .copyWith(color: Colors.green.shade700),
                            ),
                            Text("Farm fresh. No cap. Just tap"),
                            FilledButton(
                              onPressed: () {},
                              child: Text("Join now"),
                            ),
                          ],
                        ),
                      ),

                      // Image
                      Image.asset("assets/cow.png", width: 110),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Featured Products",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton(onPressed: () {}, child: const Text("See all")),
            ],
          ),

          // Featured Product
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              return ProductsCard(product: products[index],);
            },
          ),
        ], 
      ),
    );
  }
}
