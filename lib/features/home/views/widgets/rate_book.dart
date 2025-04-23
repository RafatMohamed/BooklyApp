import 'package:flutter/material.dart';

import '../../../../core/resources/text_styles.dart';
import '../../data/book_model/book_model.dart';

class RateForBook extends StatelessWidget {
  const RateForBook({
    super.key, required this.homeModel,
  });
  final BookModel homeModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 20),
        const SizedBox(width: 4),
        Text(
          '${homeModel.volumeInfo?.averageRating?.round() ?? 0}',
          style: Styles(context).textStyle26.copyWith(fontSize: 18),
        ),
        const SizedBox(width: 4),
         Text('(${homeModel.volumeInfo?.ratingsCount ?? 0 })', style: Styles(context).textStyle18),
      ],
    );
  }
}