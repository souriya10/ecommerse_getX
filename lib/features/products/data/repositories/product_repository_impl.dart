
import 'package:ecommerse_getx/features/products/data/datasources/product_remote_data_source.dart';
import 'package:ecommerse_getx/features/products/domain/entities/product.dart';
import 'package:ecommerse_getx/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Product>> getProducts() async {
    return await remoteDataSource.getProducts();
  }
}
