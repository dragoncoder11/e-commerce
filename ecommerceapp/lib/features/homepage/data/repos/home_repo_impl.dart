import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/features/homepage/data/models/alll_product_model.dart';
import 'package:ecommerceapp/features/homepage/data/repos/home_repo.dart';
import 'package:ecommerceapp/features/homepage/data/services/all_product_service.dart';

class HomeRepoImpl implements HomeRepo{
  late AllProductService allProductService;
  @override
  Future<Either<Error, List<GetAllProductsModel>>> fetchProductsData()async {
     try {
  var data =await allProductService.getAllProducts(endPoint:'products');
  
   List<GetAllProductsModel> Products = [];
   for (var i in data) {
     Products.add(GetAllProductsModel.fromJson(data[i]));
   }
   return right(Products);
} on Exception catch (e) {
  return left(e.toString() as Error);
}

  }
}