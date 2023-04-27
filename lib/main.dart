import 'package:flutter/material.dart';
import 'package:mvc_api/view/product_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProductDetails(),
    );
  }
}
