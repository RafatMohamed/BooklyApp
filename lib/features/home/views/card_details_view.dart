import 'package:bookly_app_t/features/home/views/widgets/custom_image_w.dart';
import 'package:bookly_app_t/features/home/views/widgets/details_book_animation.dart';
import 'package:flutter/material.dart';

import '../../../core/helper/my_navigator_app.dart';
import '../../../core/resources/app_padding.dart';

class CardDetailsView extends StatelessWidget{
  const CardDetailsView({super.key});

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.a20,
          child: Column(
            children: [
              const CustomAppBarWidget(),
              const SizedBox(height: 20,),
              customImage(height: 260),
              SizedBox(
                width: MediaQuery.sizeOf(context).width*0.6,
                child: const DetailsBookAnimation(isDetails: true,),
              )
            ],
          ),
        ),
      ),
    );
  }

}
class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            AppNavigator.navigatorPop(context: context);
          },
          icon: const Icon(Icons.close, size: 32),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart_checkout_outlined, size: 32),
        ),
      ],
    );
  }
}