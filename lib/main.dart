
import 'package:ecommerce_app_huma_volve/core/routes/app_routing.dart';
import 'package:ecommerce_app_huma_volve/core/theme.dart';
import 'package:ecommerce_app_huma_volve/features/auth/auth_dependencies.dart';

import 'package:ecommerce_app_huma_volve/features/home/data/models/category_hive_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/product_hive_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/product_cached_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Register Hive Adapters
  Hive.registerAdapter(CategoryHiveModelAdapter());
  Hive.registerAdapter(ProductHiveModelAdapter());
  Hive.registerAdapter(ProductCachedModelAdapter());

  // Open Hive Boxes
  await Hive.openBox<CategoryHiveModel>('categories');
  await Hive.openBox<ProductCachedModel>('products');

  runApp(
    BlocProvider(
      create: (_) => createAuthCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'E-Commerce App',
      routerConfig: appRouting,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
    );
  }
}
