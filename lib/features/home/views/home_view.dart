import 'package:bookly_app/core/resources/app_padding.dart';
import 'package:bookly_app/features/home/views/widgets/custtom_nav_bar.dart';
import 'package:bookly_app/features/home/views/widgets/list_view_home.dart';
import 'package:flutter/material.dart';
import 'widgets/custom_app_bar_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
                  const ListViewHome(),
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
