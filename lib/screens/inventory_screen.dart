import 'package:flutter/material.dart';
import '../widgets/product_input.dart';
import '../widgets/product_display.dart';
import '../widgets/user_info.dart';
import '../models/product.dart';
import '../models/user.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({Key? key}) : super(key: key);

  @override
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  Product? currentProduct;
  final User user = User(
    id: 'U001',
    username: 'john.doe',
    designation: 'Inventory Manager',
    companyName: 'ABC Corp',
  );
  final String deviceId = 'D001';

  void handleProductFetch(Product product) {
    setState(() {
      currentProduct = product;
    });
  }

  void handleStockUpdate(int newStock) {
    if (currentProduct != null) {
      setState(() {
        currentProduct = currentProduct!.copyWith(currentStock: newStock);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory Management'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductInput(onProductFetch: handleProductFetch),
            if (currentProduct != null) ...[
              const SizedBox(height: 16),
              ProductDisplay(
                product: currentProduct!,
                onStockUpdate: handleStockUpdate,
              ),
              const SizedBox(height: 16),
              UserInfo(user: user, deviceId: deviceId),
            ],
          ],
        ),
      ),
    );
  }
}
