import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/resources/app_padding.dart';
import '../../../../core/resources/text_styles.dart';
import '../../data/book_model/book_model.dart';
import 'list_view_horz_widget.dart';
import 'list_view_vert_widget.dart';

class ListViewHome extends StatelessWidget {
  const ListViewHome({super.key, required this.homeModel,});
  final BookModel homeModel;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
           ListViewHorz(homeModel: homeModel,),
          const SizedBox(height: 20),
          Text("newReleases".tr(),
              style: Styles(context).textStyle30.copyWith(fontSize: 24)),
          const SizedBox(height: 10),
          Padding(padding: AppPadding.e20, child:  ListViewVert(bookModel: homeModel,)),
        ],
      ),
    );
  }
}
