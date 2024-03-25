import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/features/homepage/data/models/alll_product_model.dart';

abstract class HomeRepo {
  Future<Either<Error, List<GetAllProductsModel>>> fetchProductsData();
}