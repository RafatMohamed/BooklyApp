import 'package:bookly_app_t/features/home/data/book_model/book_model.dart';
import 'package:easy_localization/easy_localization.dart';
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
          text: "forFree".tr(),
          isButton: false,
        )  ,
        DefaultTextButton(
          onPressed: () async {
          final Uri url= Uri.parse("${bookModel.volumeInfo?.previewLink}");
                await launchUrl(url, mode: LaunchMode.inAppWebView); // Opens in browser
          },
          text: "freePreview".tr(),
          isButton: true,
        )
      ],
    );
  }

}