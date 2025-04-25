import 'package:bookly_app_t/core/resources/text_styles.dart';
import 'package:flutter/material.dart';
import '../../../../core/helper/my_navigator_app.dart';
import '../../../../core/resources/app_color.dart';
import '../../data/book_model/book_model.dart';
import '../card_details_view.dart';
import 'custom_image_w.dart';
import 'details_book_animation.dart';

class CustomCardBestSeller extends StatelessWidget {
  const CustomCardBestSeller({super.key, required this.homeModel, required this.allBooks,  this.isLoading=false,});
  final BookModel homeModel;
  final List<BookModel> allBooks;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.navigatorPushGo(
          navigatorToPage: () =>  CardDetailsView(homeModel:homeModel ,allBooks: allBooks,),
        );
      },
      child: Container(
        padding: const EdgeInsetsDirectional.only(end: 16),
        decoration: BoxDecoration(
          gradient:  LinearGradient(
            end: AlignmentDirectional.topCenter,
            begin: AlignmentDirectional.bottomEnd,
            colors: [AppColor(context).whiteColor.withValues(alpha:0.7) ,
              AppColor(context).blackColor.withValues(alpha:0.7)],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        height: MediaQuery.sizeOf(context).height * 1 / 5.5,
        width: double.infinity,
        child:isLoading? Center(child: Text("Waiting.....",textAlign: TextAlign.center,style: Styles(context).textStyle30,),):Row(
          children: [
            customImage(homeModel: homeModel,width: 100,),
            const SizedBox(width: 14),
             Expanded(
              child: DetailsBookAnimation(homeModel: homeModel,),
            ),
          ],
        ),
      ),
    );
  }
}


