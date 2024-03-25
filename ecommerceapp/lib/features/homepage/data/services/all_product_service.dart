import 'package:dio/dio.dart';
import 'package:ecommerceapp/features/homepage/data/models/alll_product_model.dart'; 

class AllProductService {
  final Dio dio;
  final String baseurl = 'https://fakestoreapi.com/';
  AllProductService({required this.dio});

  Future<List<dynamic>> getAllProducts(
      {required String endPoint}) async {
    try {
      Response response = await dio.get('baseurl$endPoint');
      List<dynamic> data = response.data;
     
      return data;
    } catch (e) {
      print('Error fetching products: $e');
      return [];
    }
  }
}
