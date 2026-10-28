

import 'package:ecommerce_app_huma_volve/core/routes/app_routing.dart';
import 'package:ecommerce_app_huma_volve/features/auth/auth_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme.dart';

void main() {
  runApp(BlocProvider(create: (_) => createAuthCubit(), child: const MyApp()));
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
