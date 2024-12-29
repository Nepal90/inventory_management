import 'package:flutter/material.dart';
import '../widgets/product_input.dart';
import '../widgets/product_display.dart';
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
  bool showUserInfo = false;

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

  void toggleUserInfo() {
    setState(() {
      showUserInfo = !showUserInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Inventory Management',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ProductInput(onProductFetch: handleProductFetch),
              ),
            ),
            if (currentProduct != null) ...[
              const SizedBox(height: 16),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ProductDisplay(
                        product: currentProduct!,
                        onStockUpdate: handleStockUpdate,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: toggleUserInfo,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                        ),
                        child: Text(
                          showUserInfo
                              ? 'Hide User Information'
                              : 'Show User Information',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            if (showUserInfo) ...[
              const SizedBox(height: 16),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User ID: ${user.id}',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Username: ${user.username}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Designation: ${user.designation}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Company Name: ${user.companyName}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Device ID: $deviceId',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
