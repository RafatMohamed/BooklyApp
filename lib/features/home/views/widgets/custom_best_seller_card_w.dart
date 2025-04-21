import 'package:bookly_app/features/home/views/widgets/custom_image_w.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/text_styles.dart';

class CustomCardBestSeller extends StatelessWidget {
  const CustomCardBestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Harry Potter and the Goblet of fire",
                  style: Styles.textStyle26,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
                const Text("J.K.Rowling", style: Styles.textStyle20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "500 E£",
                      style: Styles.textStyle30.copyWith(fontSize: 26),
                    ),
                    Row(
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
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
