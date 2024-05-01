import 'dart:developer';

import 'package:e_commerce/core/helper/utilities/app_strings.dart';
import 'package:e_commerce/core/helper/utilities/local_data.dart';
import 'package:e_commerce/features/home/domain/entity/categort_entity.dart';
import 'package:e_commerce/features/home/presentation/manager/main_cubit/main_cubit.dart';
import 'package:e_commerce/features/splash/page/splash_page.dart';
import 'package:e_commerce/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInj();
  await Hive.initFlutter();
  Hive.registerAdapter(CategoryEntityAdapter());
  await Hive.openBox<CategoryEntity>(AppStrings.categoryBox);
  runApp(BlocProvider(
    create: (context) => MainCubit(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    log(LocalData.token.toString());
    return const MaterialApp(
      title: 'e-commerce App',
      home: SplashPage(),
    );
  }
}
