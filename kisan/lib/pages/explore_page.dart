import 'package:flutter/material.dart';
import 'package:kisan/options/crop.dart';
import 'package:kisan/options/items.dart';
import 'package:kisan/options/rent.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final options = [const Crop(), const Items(), const Rent()];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: const EdgeInsets.all(16),
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
      
      )
    );
  }
}
