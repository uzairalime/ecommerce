import 'package:ecommerce/view/checkout_screen.dart';
import 'package:ecommerce/view/dashboard.dart';
import 'package:ecommerce/view/home_screen.dart';
import 'package:ecommerce/view/payment_screen.dart';
import 'package:ecommerce/view/product_details_screen.dart';
import 'package:ecommerce/view/search_product_screen.dart';
import 'package:ecommerce/view/test_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const HomeScreen(),
      home: const DashBoard(),
      // home: const TestScreen(),
      // home: PaymentScreen(),
      // home: const MyWidget(),
      // home: SearchProductScreen(),
      // home: ProductDetailsScreen(),
    );
  }
}
