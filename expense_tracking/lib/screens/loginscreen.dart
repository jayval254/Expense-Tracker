// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//Login widget for the login screen
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

   // Function to handle phone call
  void _callSupport() async {
    const phoneNumber = 'tel:254721393483'; // Replace with your support phone number
    if (await canLaunchUrl(Uri.parse(phoneNumber))) {
      await launchUrl(Uri.parse(phoneNumber));
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Username TextField
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Password TextField
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Row with Login and Registration Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 const SizedBox(height: 20),
                 
                ElevatedButton(
                  onPressed: () {
                    print('Login clicked with username: ${usernameController.text}');
                  },
                  child: const Text('Login'),
                ),

                const SizedBox(width: 20), // Fixed space between

                OutlinedButton(
                  onPressed: () {
                    print('Register clicked');
                  },
                  child: const Text('Register'),
                ),

                  
                ],
              ),

             const SizedBox(height: 60),
                 //added call button
                ElevatedButton.icon(
                  onPressed: _callSupport,
                   icon: const Icon(Icons.phone),
                   label: const Text('Call Support'),
                  style: ElevatedButton.styleFrom(
                  //backgroundColor: Color.fromARGB(255, 144, 184, 223),
                  backgroundColor:Colors.blue.shade200),
                //call button  
                ),
          ],
        ),
      ),

      
    );
  }
}