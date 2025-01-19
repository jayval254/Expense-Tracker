// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:expense_tracking/models/trancs.dart';
import 'package:expense_tracking/screens/loginscreen.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'firebase_options.dart';

void main() async {

WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Register the TransactionAdapter
  Hive.registerAdapter(TransactionAdapter());

  // Open the Hive box
  await Hive.openBox('transactions');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const ExpenseTracker());
}

class ExpenseTracker extends StatelessWidget {
  const ExpenseTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker App'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Styled Container with Welcome Message
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Welcome!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),

              // Image Widget
              Image.network(
                'data:image/jpeg;base64,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',
                height: 150,
                width: 150,
              ),
              const SizedBox(height: 20),

              // Interactive Button
              ElevatedButton(
                onPressed: () {
                  print('Button Clicked!');
                },
                child: const Text('Get Started'),
              ),

             const SizedBox(height: 40),
            Align(
              alignment: Alignment.bottomRight,
              child: 
              FloatingActionButton(
                shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.all(
                 Radius.circular(30),
                ),
                side: BorderSide(
                width: 2.0,
                ),
                ),

          
               onPressed: () {
                Navigator.push(
               context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                 );
               },
          
                child: const Icon(Icons.arrow_forward),
              ),
            ),

            ],
          ),
        ),
      ),
    );
  }
}