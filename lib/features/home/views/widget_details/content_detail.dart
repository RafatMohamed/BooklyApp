import 'package:flutter/material.dart';
import '../../../../core/resources/text_styles.dart';
import '../../data/book_model/book_model.dart';
import '../widgets/custom_image_w.dart';
import '../widgets/details_book_animation.dart';
import 'custom_app_bar.dart';
import 'custom_text_button_w.dart';

class ContentDetailsW extends StatelessWidget {
  const ContentDetailsW({
    super.key, required this.homeModel,
  });
  final BookModel homeModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBarDetails(),
        const SizedBox(height: 20,),
        customImage(height: 260,homeModel: homeModel),
        const SizedBox(height: 20,),
        SizedBox(
          width: MediaQuery.sizeOf(context).width*0.6,
          child:  DetailsBookAnimation(isDetails: true,homeModel: homeModel,),
        ),
        const SizedBox(height: 24,),
         CustomTextButt(bookModel: homeModel),
        const SizedBox(height: 24,),
        Align(alignment: AlignmentDirectional.centerStart,child: Text("you can also Like: ", style: Styles.textStyle30.copyWith(fontSize: 24))),
        const SizedBox(height: 16,),
      ],
    );
  }
}
