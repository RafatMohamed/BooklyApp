import 'package:flutter/material.dart';

import '../../../../core/resources/text_styles.dart';

class RateForBook extends StatelessWidget {
  const RateForBook({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 20),
        const SizedBox(width: 4),
        Text(
          '4.5',
          style: Styles.textStyle26.copyWith(fontSize: 18),
        ),
        const SizedBox(width: 4),
        const Text('(4395)', style: Styles.textStyle18),
      ],
    );
  }
}