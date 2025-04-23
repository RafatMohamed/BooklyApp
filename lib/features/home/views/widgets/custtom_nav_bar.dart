import 'package:flutter/material.dart';
import '../../../../core/resources/app_color.dart';
import '../../../../core/resources/app_image.dart';
import '../../../../core/resources/app_padding.dart';

class CustomNabBar extends StatelessWidget {
  const CustomNabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      left: 25,
      right: 25,
      child: Padding(
        padding: AppPadding.e20,
        child: Container(
          padding: const EdgeInsetsDirectional.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              end: AlignmentDirectional.topStart,
              begin: AlignmentDirectional.bottomEnd,
              colors:  [AppColor(context).whiteColor.withValues(alpha:0.7) ,
                AppColor(context).blackColor.withValues(alpha:0.7)],
            ),
            borderRadius: BorderRadius.circular(40),
          ),
          width: MediaQuery.sizeOf(context).width * 0.7,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.home_max),
                highlightColor: AppColor(context).highlightColor,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.area_chart),
                highlightColor: AppColor(context).highlightColor,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.music_video_sharp),
                highlightColor: AppColor(context).highlightColor,
              ),
              IconButton(
                onPressed: () {},
                icon: ClipOval(
                  child: Image.asset(
                    AppImage.imageTest,
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                highlightColor: AppColor(context).highlightColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
