import 'package:ecommerceapp/features/homepage/presentation/manager/products_cubit/products_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_item.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  void initState() {
BlocProvider.of<ProductsCubit>(context).fetchProductsData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductsFailure) {
          return Text(state.errMessage);
        } else if (state is ProductsSuccess) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4 / 6.5,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return CustomItem(image: state.products[index].image, rate: state.products[index].rating.rate.toString(), price: state.products[index].price.toString(), title: state.products[index].title);
              },
              itemCount: state.products.length,
            ),
          );
        } else {
          return const Center(child: Text('Unknown state'));
        }
      },
    );
  }
}
