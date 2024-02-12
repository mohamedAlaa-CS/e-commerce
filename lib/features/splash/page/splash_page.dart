import 'dart:async';

import 'package:e_commerce/core/helper/utilities/app_routes.dart';
import 'package:e_commerce/core/helper/utilities/app_strings.dart';
import 'package:e_commerce/core/helper/utilities/local_data.dart';
import 'package:e_commerce/features/Auth/presentation/pages/login_page.dart';
import 'package:e_commerce/features/home/presentation/pages/main_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      AppRoutes.routeTo(
        context,
        LocalData.token != null ? const MainPage() : const LoginPage(),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AppStrings.splash,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
