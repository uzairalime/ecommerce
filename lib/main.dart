import 'package:ecommerce/view/authorization/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const DashBoard(),
      home: const LoginScreen(),
      // home: const HomeScreen(),
      // home: const ProductDetailsScreen(),
      // home: const TestScreen(),
      // home: PaymentScreen(),
      // home: const MyWidget(),
      // home: SearchProductScreen(),
      // home: ProductDetailsScreen(),
    );
  }
}
