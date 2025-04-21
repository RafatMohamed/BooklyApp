import 'package:flutter/material.dart';

import '../../../../core/resources/text_styles.dart';
import '../widgets/custom_app_bar_widget.dart';
import '../widgets/custom_image_w.dart';
import '../widgets/details_book_animation.dart';
import 'custom_app_bar.dart';
import 'custom_text_button_w.dart';

class ContentDetailsW extends StatelessWidget {
  const ContentDetailsW({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBarDetails(),
        const SizedBox(height: 20,),
        customImage(height: 260),
        const SizedBox(height: 20,),
        SizedBox(
          width: MediaQuery.sizeOf(context).width*0.6,
          child: const DetailsBookAnimation(isDetails: true,),
        ),
        const SizedBox(height: 24,),
        const CustomTextButt(),
        const SizedBox(height: 24,),
        Align(alignment: AlignmentDirectional.centerStart,child: Text("you can also Like: ", style: Styles.textStyle30.copyWith(fontSize: 24))),
        const SizedBox(height: 16,),
      ],
    );
  }
}
