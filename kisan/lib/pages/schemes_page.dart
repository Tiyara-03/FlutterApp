import 'package:flutter/material.dart';

class SchemesPage extends StatefulWidget {
  const SchemesPage({super.key});

  @override
  State<SchemesPage> createState() => _SchemesPageState();
}

class _SchemesPageState extends State<SchemesPage> {
  // 👇 Sample hardcoded schemes data
  final List<Map<String, String>> schemes = [
    {
      'title': 'Mukhyamantri Krishi Ashirwad Yojana',
      'benefit': '₹5,000 per acre annually (up to 5 acres)',
      'eligibility': 'Farmers owning up to 5 acres of land'
    },
    {
      'title': 'Kisan Samriddhi Yojana',
      'benefit': 'Up to 90% subsidy for solar irrigation units',
      'eligibility': 'All Jharkhand farmers'
    },
    {
      'title': 'Pashudhan Vikas Yojana',
      'benefit': '50–90% subsidy on dairy animal purchase',
      'eligibility': 'Livestock farmers in Jharkhand'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Farmer Schemes in Jharkhand'),
        backgroundColor: Colors.green.shade700,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: schemes.length,
        itemBuilder: (context, index) {
          final scheme = schemes[index];
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    scheme['title'] ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '🟢 Benefit: ${scheme['benefit']}',
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '👤 Eligibility: ${scheme['eligibility']}',
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
