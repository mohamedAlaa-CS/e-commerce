import 'package:e_commerce/features/Auth/presentation/pages/login_page.dart';
import 'package:e_commerce/features/home/presentation/manager/main_cubit/main_cubit.dart';
import 'package:e_commerce/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInj();
  runApp(BlocProvider(
    create: (context) => MainCubit(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'e-commerce App',
      home: LoginPage(),
    );
  }
}
