import 'package:flutter/material.dart';
import 'custom_best_seller_card_w.dart';

class ListViewVert extends StatelessWidget {
  const ListViewVert({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return const Column(
          children: [
            CustomCardBestSeller(),
            SizedBox(height: 20,),
          ],
        );
      },
      itemCount: 10,
    );
  }
}
