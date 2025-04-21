import 'package:bookly_app_t/core/helper/my_navigator_app.dart';
import 'package:bookly_app_t/features/search/views/search_view.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/app_image.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(AppImage.logoImage, width: 120),
        IconButton(
          onPressed: () {
            AppNavigator.navigatorPushGo(navigatorToPage: () =>const SearchView(),);
          },
          icon: const Icon(Icons.search_sharp, size: 32),
        ),
      ],
    );
  }
}
