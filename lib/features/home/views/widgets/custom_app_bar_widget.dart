import 'package:bookly_app_t/app/logic/them_toggle_cubit.dart';
import 'package:bookly_app_t/app/logic/them_toggle_state.dart';
import 'package:bookly_app_t/core/helper/my_navigator_app.dart';
import 'package:bookly_app_t/features/search/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/app_color.dart';
import '../../../../core/resources/app_image.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({super.key,});
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(AppImage.logoImage, width: 120,color: AppColor(context).whiteColor,),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    AppNavigator.navigatorPushGo(
                      navigatorToPage: () =>  const SearchView(),);
                  },
                  icon: const Icon(Icons.search_sharp, size: 32),
                ),
                BlocBuilder<ThemToggleCubit, ThemToggleState>(
                  builder: (context, state) {
                    final cubit = context.read<ThemToggleCubit>();
                    return IconButton(
                      onPressed: () {
                        cubit.toggleTheme();
                      },
                      icon:  Icon(cubit.isDark ? Icons.toggle_on_outlined : Icons.toggle_off_outlined, size: 32),
                    );
                  },
                ),
              ],
            ),
          ],
        );
      }
    );
  }
}
