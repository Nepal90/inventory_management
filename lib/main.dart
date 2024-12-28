import 'package:flutter/material.dart';
import 'package:inventory_management/screens/dashboard_screen.dart';
import 'package:inventory_management/screens/login_screen.dart';
import 'package:inventory_management/screens/signup_screen.dart';
import 'screens/inventory_screen.dart';

void main() {
  runApp(const InventoryApp());
}

class InventoryApp extends StatelessWidget {
  const InventoryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inventory Management',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: 'SignInScreen',
      routes: {
        'SignInScreen': (context) => SignInScreen(),
        'SignUpScreen': (context) => SignUpScreen(),
        'InventoryScreen': (context) => const InventoryScreen(),
        'DashboardScreen': (context) => DashboardScreen(),
      // '/userInformation': (context) => UserInformationScreen(),
      // '/account': (context) => AccountScreen(),
      // '/addProduct': (context) => AddProductScreen(),
      },
    );
  }
}
