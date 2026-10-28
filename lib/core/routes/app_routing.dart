import 'package:ecommerce_app_huma_volve/features/details/data/data_source/datails_data_source_imp.dart';
import 'package:ecommerce_app_huma_volve/features/details/data/repo/product_details_repo_imp.dart';
import 'package:ecommerce_app_huma_volve/features/details/domain/use_case/get_products_usecase.dart';
import 'package:ecommerce_app_huma_volve/features/details/peresentation/view_model/details_cubit.dart';
import 'package:ecommerce_app_huma_volve/features/splash/screens/splash_screen.dart';
import 'package:ecommerce_app_huma_volve/features/details/peresentation/view/screens/product_details_screen.dart';

import 'package:ecommerce_app_huma_volve/core/network/api_client.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final appRouting = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const SplashScreen();
      },
    ),

    GoRoute(
      path: '/product/:productId',
      builder: (context, state) {
        final productId = int.parse(state.pathParameters['productId']!);

        final apiClient = ApiClient();

        final remoteDataSource = DatailsDataSourceImp(apiClient);

        final repository = ProductDetailsRepoImp(remoteDataSource);

        final useCase = GetProductDetailsUseCase(repository);

        return BlocProvider(
          create: (_) => DetailsCubit(useCase),
          child: ProductDetailsScreen(productId: productId),
        );
      },
    ),
  ],
);
