import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/features/homepage/data/models/alll_product_model.dart';
import 'package:ecommerceapp/features/homepage/data/repos/home_repo.dart';
import 'package:flutter/material.dart';

part 'products_cubit_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  late HomeRepo homeRepo;
  ProductsCubit() : super(ProductsInitial());
  Future fetchProductsData() async {
    try {
      emit(ProductsLoading());
      var result = await homeRepo.fetchProductsData();
      result.fold((failure) {
        emit(
          ProductsFailure(
            errMessage: failure.toString(),
          ),
        );
      }, (products) {
        emit(ProductsSuccess(products: products));
      });
    } on Exception catch (e) {
      return Text(
        e.toString(),
      );
    }
  }
}
