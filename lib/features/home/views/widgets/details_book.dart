import 'package:bookly_app/features/home/views/widgets/rate_book.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/text_styles.dart';

class BookDetails extends StatelessWidget{
  const BookDetails({super.key, required this.isDetails});
  final bool isDetails;
  @override
  Widget build(BuildContext context) {
   return Column(
     mainAxisAlignment: MainAxisAlignment.center,
     crossAxisAlignment:
     isDetails
         ? CrossAxisAlignment.center
         : CrossAxisAlignment.start,
     children: [
       const Text(
         "Harry Potter and the Goblet of fire",
         style: Styles.textStyle26,
         maxLines: 2,
         overflow: TextOverflow.ellipsis,
         softWrap: true,
       ),
       const Text("J.K.Rowling", style: Styles.textStyle20),
       isDetails
           ? const RateForBook()
           : Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Text(
             "500 E£",
             style: Styles.textStyle30.copyWith(fontSize: 26),
           ),
        const RateForBook(),
         ],
       ),
     ],
   );
  }
}

