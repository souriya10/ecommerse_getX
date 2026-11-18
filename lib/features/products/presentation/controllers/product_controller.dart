import 'package:get/get.dart';

import '../../domain/entities/product.dart';
import '../../domain/usecases/get_products.dart';

class ProductController extends GetxController {
  final GetProducts getProducts;

  ProductController(this.getProducts);

  final RxList<Product> products = <Product>[].obs;

  final RxBool isLoading = false.obs;

  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();

    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;

      errorMessage.value = '';

      final result = await getProducts();

      products.assignAll(result);

    } catch (e) {
      errorMessage.value = e.toString();

    } finally {
      isLoading.value = false;
    }
  }
}
