import 'package:ecommerce_app_huma_volve/features/details/peresentation/view/screens/product_details_screen.dart';
import 'package:ecommerce_app_huma_volve/features/splash/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final appRouting = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/product/:productId',
      builder: (context, state) {
        final productId = int.parse(state.pathParameters['productId']!);

        return ProductDetailsScreen(productId: productId);
      },
    ),
  ],
);
