import 'package:bookly_app/core/resources/app_padding.dart';
import 'package:bookly_app/features/home/views/widgets/list_view_horz_widget.dart';
import 'package:flutter/material.dart';
import 'widgets/custom_app_bar_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.h16V16,
          child: const Column(
            children: [
              CustomAppBarWidget(),
              SizedBox(height: 20),
              ListViewHorz(),
            ],
          ),
        ),
      ),
    );
  }
}

