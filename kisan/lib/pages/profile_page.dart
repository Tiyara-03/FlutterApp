import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kisan/data/products.dart';
import 'package:kisan/models/product.dart';
import 'package:kisan/pages/explore_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfileFormPageState();
}

class _ProfileFormPageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController productController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  File? _image;
  String? _selectedCategory;

  final List<String> _categories = ['Crop', 'Product', 'Renting'];

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() &&
        _image != null &&
        _selectedCategory != null) {
      final newProduct = Product(
        name: productController.text,
        image: _image!.path,
        price: double.parse(priceController.text),
        unit: 'piece',
        category: _selectedCategory!,
      );

      userUploadedProducts.add(newProduct);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${_selectedCategory!} uploaded successfully!')),
      );

      setState(() {
        _image = null;
        productController.clear();
        priceController.clear();
        locationController.clear();
        _selectedCategory = null;
      });
    }
  }

  Widget _quickActionCard(IconData icon, String label) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 28),
            const SizedBox(height: 6),
            Text(label, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("👨‍🌾 Farmer Dashboard")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              color: Colors.lightBlue[100],
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("🌤️ Weather", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text("Location: Lalpur"),
                    Text("Temp: 30°C"),
                    Text("Humidity: 40%"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _quickActionCard(Icons.add_box, "New Product"),
                _quickActionCard(Icons.shopping_cart, "My Listings"),
                _quickActionCard(Icons.cloud_upload, "Upload Image"),
                _quickActionCard(Icons.edit_location_alt, "Set Location"),
              ],
            ),
            const SizedBox(height: 20),
            const Text("📤 Upload Product", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: productController,
                    decoration: const InputDecoration(labelText: 'Product Name'),
                    validator: (value) => value!.isEmpty ? 'Enter product name' : null,
                  ),
                  TextFormField(
                    controller: priceController,
                    decoration: const InputDecoration(labelText: 'Price'),
                    keyboardType: TextInputType.number,
                    validator: (value) => value!.isEmpty ? 'Enter price' : null,
                  ),
                  TextFormField(
                    controller: locationController,
                    decoration: const InputDecoration(labelText: 'Location'),
                    validator: (value) => value!.isEmpty ? 'Enter location' : null,
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    value: _selectedCategory,
                    items: _categories.map((cat) {
                      return DropdownMenuItem(value: cat, child: Text(cat));
                    }).toList(),
                    onChanged: (value) => setState(() => _selectedCategory = value),
                    decoration: const InputDecoration(labelText: 'Select Category'),
                    validator: (value) => value == null ? 'Select a category' : null,
                  ),
                  const SizedBox(height: 16),
                  _image != null
                      ? Image.file(_image!, height: 200)
                      : const Text("No image selected"),
                  const SizedBox(height: 8),
                  ElevatedButton.icon(
                    onPressed: _pickImage,
                    icon: const Icon(Icons.image),
                    label: const Text("Choose from Gallery"),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: const Text("Submit"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ExpansionTile(
              title: const Text("Add Crop Details"),
              children: [
                ListTile(title: Text("Form for Crop Details (add later)")),
              ],
            ),
            ExpansionTile(
              title: const Text("Upload Equipment for Rent"),
              children: [
                ListTile(title: Text("Form for Equipment (add later)")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}