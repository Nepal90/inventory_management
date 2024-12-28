import 'package:flutter/material.dart';
import 'package:inventory_management/screens/inventory_screen.dart'; // Make sure to import the InventoryScreen

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DASHBOARD'),
        backgroundColor: Colors.blue,
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns
            crossAxisSpacing: 16.0, // space between columns
            mainAxisSpacing: 16.0, // space between rows
          ),
          children: [
            DashboardItem(
              icon: Icons.inventory,
              label: 'Inventory Screen',
              onTap: () {
                Navigator.pushNamed(context, 'InventoryScreen'); // Navigate to Inventory Screen
              },
            ),
            DashboardItem(
              icon: Icons.person,
              label: 'User Information',
              onTap: () {
                Navigator.pushNamed(context, '/userInformation'); // Navigate to User Information
              },
            ),
            DashboardItem(
              icon: Icons.account_circle,
              label: 'Account',
              onTap: () {
                Navigator.pushNamed(context, '/account'); // Navigate to Account
              },
            ),
            DashboardItem(
              icon: Icons.add_box,
              label: 'Add Product',
              onTap: () {
                Navigator.pushNamed(context, '/addProduct'); // Navigate to Add Product
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const DashboardItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.blue),
            const SizedBox(height: 10),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
