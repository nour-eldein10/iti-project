import 'package:dio/dio.dart';
import 'product_model.dart';

class ApiProvider {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://dummyjson.com',
  ));

  Future<Product> getProducts({
    int limit = 10,
    int skip = 0,
    String? category,
  }) async {
    try {
      String url = '/products';
      Map<String, dynamic> queryParams = {
        'limit': limit,
        'skip': skip,
      };

      if (category != null && category != 'All') {
        url = '/products/category/$category';
      }

      print('API call to: $url');
      print('Params: $queryParams');

      final response = await _dio.get(url, queryParameters: queryParams);

      print('API response received');
      return Product.fromJson(response.data);
    } catch (error) {
      print('API error: $error');
      throw Exception("Failed to load products: $error");
    }
  }

  Future<List<String>> getCategories() async {
    try {
      final response = await _dio.get('/products/categories');
      print('Categories API response: ${response.data}');

      List<String> categories = List<String>.from(response.data);
      categories.insert(0, 'All'); // Add 'All' at the beginning
      return categories;
    } catch (error) {
      print('Categories API error: $error');
      return ['All',  'fragrances', 'skincare', 'Perfumes', 'others'];
    }
  }

  Future<Product> getProductsByCategory(String category) async {
    try {
      final response = await _dio.get('/products/category/$category');
      return Product.fromJson(response.data);
    } catch (error) {
      print('Category products API error: $error');
      throw Exception("Failed to load category products: $error");
    }
  }
}