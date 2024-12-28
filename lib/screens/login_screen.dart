import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isEmailValid = true;

  void _validateEmail(String email) {
    setState(() {
      _isEmailValid = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$").hasMatch(email);
    });
  }

  void _handleSignIn(BuildContext context) {
    // Example validation logic (you can customize this as needed)
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _isEmailValid) {
      // Navigate to Dashboard Screen and remove the SignInScreen from the navigation stack
      Navigator.pushReplacementNamed(context, 'DashboardScreen');
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter valid credentials')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Center(child: Image.asset('assets/teacher.png', height: 80)),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    'Envt.Management.',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    labelText: 'Email',
                    errorText: _isEmailValid ? null : 'Incorrect Email Address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onChanged: _validateEmail,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    labelText: 'Password',
                    suffixIcon: const Icon(Icons.visibility_off),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Forgot Password logic here
                    },
                    child: const Text('Forgot Password?'),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _handleSignIn(context); // Handle Sign In logic
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // Square corners
                      ),
                    ),
                    child: const Text('Sign In', style: TextStyle(fontSize: 16)),
                  ),
                ),
                const SizedBox(height: 20),
                const Center(
                  child: Text('OR'),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Google Sign In logic here
                    },
                    icon: Image.asset('assets/google.png', height: 24),
                    label: const Text('Continue with Google', style: TextStyle(fontSize: 16)),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.grey),
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('New to Envt. Management.?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'SignUpScreen');
                        },
                        child: const Text('Sign Up'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
