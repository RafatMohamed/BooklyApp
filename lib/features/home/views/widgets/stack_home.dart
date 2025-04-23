import 'package:flutter/material.dart';

import '../../../../core/resources/app_padding.dart';
import '../../data/book_model/book_model.dart';
import 'custom_app_bar_widget.dart';
import 'custtom_nav_bar.dart';
import 'list_view_home.dart';

class StackHome extends StatelessWidget {
  const StackHome({
    super.key,
    required this.homeModel,
  });

  final BookModel homeModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: AppPadding.e20,
              child:  const CustomAppBarWidget(),
            ),
            const SizedBox(height: 16),
            ListViewHome(homeModel: homeModel,),
          ],
        ),
        const CustomNabBar(),
      ],
    );
  }
}
