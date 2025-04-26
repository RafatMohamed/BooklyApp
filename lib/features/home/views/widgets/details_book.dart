import 'package:bookly_app_t/features/home/views/widgets/rate_book.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/text_styles.dart';
import '../../data/book_model/book_model.dart';

class BookDetails extends StatelessWidget{
  const BookDetails({super.key, required this.isDetails, required this.homeModel});
  final bool isDetails;
  final BookModel homeModel;
  @override
  Widget build(BuildContext context) {
   return Column(
     mainAxisAlignment: MainAxisAlignment.center,
     crossAxisAlignment:
     isDetails
         ? CrossAxisAlignment.center
         : CrossAxisAlignment.start,
     children: [
        Text(
          textAlign:context.locale.languageCode == 'ar' ? TextAlign.end : TextAlign.start,
         "${homeModel.volumeInfo?.title}",
         style: Styles(context).textStyle26,
         maxLines: 2,
         overflow: TextOverflow.ellipsis,
         softWrap: true,
       ),
       const SizedBox(height: 10,),
       Text(
         textAlign:context.locale.languageCode == 'ar' ? TextAlign.end : TextAlign.start,
         "${homeModel.volumeInfo?.authors?[0]}", style: Styles(context).textStyle20, maxLines: 1,
         overflow: TextOverflow.ellipsis,
         softWrap: true,
       ),
       const SizedBox(height: 10,),
       isDetails
           ?  RateForBook(homeModel: homeModel,)
           : Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Text(
             "forFree".tr(),
             style: Styles(context).textStyle30.copyWith(fontSize: 26),
           ),
         RateForBook(homeModel:homeModel ,),
         ],
       ),
     ],
   );
  }
}

