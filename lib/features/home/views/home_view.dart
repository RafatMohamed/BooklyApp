import 'package:bookly_app/core/resources/app_padding.dart';
import 'package:bookly_app/core/resources/text_styles.dart';
import 'package:bookly_app/features/home/views/widgets/list_view_horz_widget.dart';
import 'package:bookly_app/features/home/views/widgets/list_view_vert_widget.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBarWidget(),
              SizedBox(height: 20),
              ListViewHorz(),
              SizedBox(height: 20),
              Text(
                "Best Seller",
                style: Styles.textStyle30,
              ),
              SizedBox(height: 10),
              Expanded(child: ListViewVert()),
            ],
          ),
        ),
      ),
    );
  }
}

