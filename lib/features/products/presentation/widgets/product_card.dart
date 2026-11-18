import 'package:flutter/material.dart';

import '../../domain/entities/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),

      child: Padding(
        padding: const EdgeInsets.all(14),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Row(
              children: [
               CircleAvatar(
  child: Text(
    product.title.isNotEmpty ? product.title[0] : '?',
  ),
),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),

                      Text('@${product.description}'),
                    ],
                  ),
                ),
              ],
            ),

            const Divider(),

            Text('category: ${product.category}'),

            Text('Price: ${product.price}'),

            Text('rating: ${product.rating}'),
            Text('Stock: ${product.stock}'),

            const SizedBox(height: 10),

             Text(
               'Dimensions: ${product.dimensions.width} x '
              '${product.dimensions.height} x '
              '${product.dimensions.depth}',
            ),
            

           Text('Reviews: ${product.reviews.length}'),

          ],
        ),
      ),
    );
  }
}
