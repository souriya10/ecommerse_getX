import 'package:get/get.dart';

import '../../../../core/network/dio_client.dart';

import '../../data/datasources/product_remote_data_source.dart';
import '../../data/repositories/product_repository_impl.dart';

import '../../domain/repositories/product_repository.dart';
import '../../domain/usecases/get_products.dart';

import '../controllers/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<DioClient>(
      () => DioClient(),
    );

    Get.lazyPut<ProductRemoteDataSource>(
      () => ProductRemoteDataSource( dioClient: 
        Get.find<DioClient>(),
      ),
    );

    Get.lazyPut<ProductRepository>(
      () => ProductRepositoryImpl(remoteDataSource: 
        Get.find<ProductRemoteDataSource>(),
      ),
    );

    Get.lazyPut<GetProducts>(
      () => GetProducts(repository: 
        Get.find<ProductRepository>(),
      ),
    );

    Get.lazyPut<ProductController>(
      () => ProductController(
        Get.find<GetProducts>(),
      ),
    );
  }
}
