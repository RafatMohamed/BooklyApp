import 'package:bookly_app/core/helper/my_navigator_app.dart';
import 'package:bookly_app/features/home/views/widgets/custom_image_w.dart';
import 'package:flutter/material.dart';
import '../card_details_view.dart';
import 'details_book_animation.dart';

class CustomCardBestSeller extends StatelessWidget {
  const CustomCardBestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.navigatorPushGo(
          navigatorToPage: () => const CardDetailsView(),
        );
      },
      child: Container(
        padding: const EdgeInsetsDirectional.only(end: 16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            end: AlignmentDirectional.topCenter,
            begin: AlignmentDirectional.bottomEnd,
            colors: [Colors.white10, Colors.black],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        // height: MediaQuery.sizeOf(context).height * 1 / 5.5,
        width: double.infinity,
        child: Row(
          children: [
            customImage(),
            const SizedBox(width: 14),
            const Expanded(
              child: DetailsBookAnimation(),
            ),
          ],
        ),
      ),
    );
  }
}


