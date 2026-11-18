
import 'package:ecommerse_getx/features/products/domain/entities/product.dart';
import 'package:ecommerse_getx/features/products/domain/repositories/product_repository.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts({required this.repository});

  Future<List<Product>> call() async {
    return await repository.getProducts();
  }
}
