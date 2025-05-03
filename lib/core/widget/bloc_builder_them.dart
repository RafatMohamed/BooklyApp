import 'package:bookly_app_t/core/resources/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/logic/them_toggle_cubit.dart';
import '../../app/logic/them_toggle_state.dart';

class ThemToggleBuilder extends StatelessWidget {
  const ThemToggleBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemToggleCubit, ThemToggleState>(
      builder: (context, state) {
        final cubit = context.read<ThemToggleCubit>();
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor(context).blackColor,
          ),
          child: IconButton(
            highlightColor: Colors.transparent,
            onPressed: () {
              cubit.toggleTheme();
            },
            icon: Icon(
              cubit.isDark
                  ? Icons.toggle_on_outlined
                  : Icons.toggle_off_outlined,
              size: 32,
              color:AppColor(context).whiteColor,
            ),
          ),
        );
      },
    );
  }
}