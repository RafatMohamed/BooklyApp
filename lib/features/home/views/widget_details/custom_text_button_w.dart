import 'package:bookly_app_t/features/home/data/book_model/book_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/widget/default_text_butt.dart';

class CustomTextButt extends StatelessWidget{
  const CustomTextButt({super.key, required this.bookModel});
 final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        DefaultTextButton(
          onPressed: () {},
          text: "For Free E£",
          isButton: false,
        )  ,
        DefaultTextButton(
          onPressed: () async {
          final Uri url= Uri.parse("${bookModel.volumeInfo?.previewLink}");
                await launchUrl(url, mode: LaunchMode.externalApplication); // Opens in browser
          },
          text: "Free Preview",
          isButton: true,
        )
      ],
    );
  }

}