part of 'products_cubit_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}
final class ProductsSuccess extends ProductsState {
  final List<GetAllProductsModel> products;

  ProductsSuccess({required this.products});
}
final class ProductsLoading extends ProductsState {}
final class ProductsFailure extends ProductsState {
  final String errMessage;

  ProductsFailure({required this.errMessage});
}

