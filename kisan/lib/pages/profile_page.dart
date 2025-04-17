import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print("Product: \${productController.text}");
      print("Price: \${priceController.text}");
      print("Location: \${locationController.text}");
      print("Image path: \${_image?.path}");
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
            // Weather Widget
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              color: Colors.lightBlue[100],
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
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

            // Quick Action Grid
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

            // Product Upload Form
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
                  const SizedBox(height: 16),
                  _image != null
                      ? Image.file(_image!, height: 200)
                      : const Text("No image selected"),
                  const SizedBox(height: 8),
                  ElevatedButton.icon(
                    onPressed: _pickImage,
                    icon: const Icon(Icons.camera_alt),
                    label: const Text("Capture Image"),
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
            // Expansion Forms
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
