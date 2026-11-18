import 'package:ecommerse_getx/features/products/presentation/bindings/product_binding.dart';
import 'package:ecommerse_getx/features/products/presentation/pages/product_page.dart';
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
      debugShowCheckedModeBanner: false,

      title: 'Product API With GetX',

      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),

      initialBinding: ProductBinding(),

      home: const ProductPage(),
    );
  }
}
