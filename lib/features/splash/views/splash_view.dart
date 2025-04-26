import 'package:bookly_app_t/core/resources/app_color.dart';
import 'package:bookly_app_t/core/widget/custom_logo.dart';
import 'package:bookly_app_t/features/splash/views/widgets/splash_view_builder_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/app_image.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customLogo(context: context, width: MediaQuery.sizeOf(context).width * 0.7),
            const SizedBox(height: 4),
            const SplashViewWidget(),
          ],
        ),
      ),
    );
  }
}

