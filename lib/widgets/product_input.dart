import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductInput extends StatefulWidget {
  final Function(Product) onProductFetch;

  const ProductInput({Key? key, required this.onProductFetch}) : super(key: key);

  @override
  _ProductInputState createState() => _ProductInputState();
}

class _ProductInputState extends State<ProductInput> {
  final _formKey = GlobalKey<FormState>();
  final _productIdController = TextEditingController();

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      // Mock API call (replace with actual API call in a real application)
      final mockProduct = Product(
        id: _productIdController.text,
        name: 'Sample Product',
        description: 'This is a sample product description.',
        photoUrl: 'https://via.placeholder.com/200',
        firstInventoryDate: DateTime.now(),
        supervisorName: 'Jane Smith',
        currentStock: 100,
      );
      widget.onProductFetch(mockProduct);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _productIdController,
              decoration: const InputDecoration(
                labelText: 'Enter 5-digit product ID',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a product ID';
                }
                if (!RegExp(r'^[A-Za-z0-9]{5}$').hasMatch(value)) {
                  return 'Please enter a valid 5-digit product ID';
                }
                return null;
              },
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: _handleSubmit,
            child: const Text('Fetch Product'),
          ),
        ],
      ),
    );
  }
}