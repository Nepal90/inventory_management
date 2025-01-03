import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDisplay extends StatefulWidget {
  final Product product;
  final Function(int) onStockUpdate;

  const ProductDisplay({
    Key? key,
    required this.product,
    required this.onStockUpdate,
  }) : super(key: key);

  @override
  _ProductDisplayState createState() => _ProductDisplayState();
}

class _ProductDisplayState extends State<ProductDisplay> {
  late TextEditingController _stockController;

  @override
  void initState() {
    super.initState();
    _stockController =
        TextEditingController(text: widget.product.currentStock.toString());
  }

  @override
  void dispose() {
    _stockController.dispose();
    super.dispose();
  }

  void _handleStockUpdate() {
    final newStock = int.tryParse(_stockController.text);
    if (newStock == null || newStock < 0) {
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid stock value.'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      
      widget.onStockUpdate(newStock);

     
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Stock updated successfully to $newStock.'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  widget.product.photoUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.broken_image,
                        size: 100, color: Colors.grey);
                  },
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(widget.product.description),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text('Product ID: ${widget.product.id}'),
            Text(
                'First Inventory Date: ${widget.product.firstInventoryDate.toLocal()}'),
            Text('Supervisor: ${widget.product.supervisorName}'),
            Text('Current Stock: ${widget.product.currentStock}'),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _stockController,
                    decoration: const InputDecoration(
                      labelText: 'New stock value',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _handleStockUpdate,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  child: const Text('Update Stock'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
