import 'package:flutter/material.dart';

import '../../../../core/helper/my_navigator_app.dart';

class CustomAppBarDetails extends StatelessWidget {
  const CustomAppBarDetails({super.key});

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