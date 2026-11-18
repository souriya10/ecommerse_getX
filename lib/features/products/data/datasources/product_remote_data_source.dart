
import 'package:dio/dio.dart';
import 'package:ecommerse_getx/core/network/dio_client.dart';
import 'package:ecommerse_getx/features/products/data/models/product_model.dart';

class ProductRemoteDataSource {
  final DioClient dioClient;

  ProductRemoteDataSource({required this.dioClient});

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dioClient.dio.get('/products');

      final List productsJson = response.data['products'];

      return productsJson
          .map((product) => ProductModel.fromJson(product))
          .toList();
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
