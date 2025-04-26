import 'package:bookly_app_t/core/helper/my_navigator_app.dart';
import 'package:bookly_app_t/core/widget/custom_logo.dart';
import 'package:bookly_app_t/features/search/views/search_view.dart';
import 'package:flutter/material.dart';

import '../../../../core/widget/bloc_builder_them.dart';
import '../../../../core/widget/drop_down_lang.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           customLogo(context: context, width: 120),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    AppNavigator.navigatorPush(context:   context,
                      navigatorToPage:  const SearchView(),
                    );
                  },
                  icon: const Icon(Icons.search_sharp, size: 32),
                ),
                const DropDownLang(),
                const ThemToggleBuilder(),
              ],
            ),
          ],
        );
      },
    );
  }
}
