import 'package:ecommerceapp/features/homepage/presentation/manager/products_cubit/products_cubit_cubit.dart';
import 'package:ecommerceapp/features/homepage/presentation/views/widgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(),
      child:const Scaffold(
        body: HomeBody(),
      ),
    );
  }
}
