import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_controller.dart';
import '../widgets/product_card.dart';

class ProductPage extends GetView<ProductController> {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product API'),

        actions: [
          IconButton(
            onPressed: controller.fetchProducts,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),

      body: Obx(() {

        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                Text(controller.errorMessage.value),

                const SizedBox(height: 10),

                ElevatedButton(
                  onPressed: controller.fetchProducts,
                  child: const Text('Retry'),
                ),

              ],
            ),
          );
        }

        if (controller.products.isEmpty) {
          return const Center(
            child: Text('No users found'),
          );
        }

        return RefreshIndicator(
          onRefresh: controller.fetchProducts,

          child: ListView.builder(
            itemCount: controller.products.length,

            itemBuilder: (context, index) {
              final product = controller.products[index];

              return ProductCard(product: product);
            },
          ),
        );

      }),
    );
  }
}
