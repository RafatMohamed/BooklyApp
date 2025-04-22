import 'package:bookly_app_t/features/home/views/widgets/custtom_nav_bar.dart';
import 'package:bookly_app_t/features/home/views/widgets/list_view_home.dart';
import 'package:flutter/material.dart';
import '../../../core/resources/app_padding.dart';
import '../data/book_model/book_model.dart';
import 'widgets/custom_app_bar_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.homeModel});
  final BookModel homeModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.s20T20,
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: AppPadding.e20,
                    child: const CustomAppBarWidget(),
                  ),
                  const SizedBox(height: 16),
                   ListViewHome(homeModel:homeModel ,),
                ],
              ),
              const CustomNabBar(),
            ],
          ),
        ),
      ),
    );
  }
}
