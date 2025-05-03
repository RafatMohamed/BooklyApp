import 'package:bookly_app_t/features/home/views/widget_details/content_detail.dart';
import 'package:bookly_app_t/features/search/views/widgets/list_view_related.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../core/resources/app_padding.dart';
import '../../../core/resources/text_styles.dart';
import '../data/book_model/book_model.dart';

class CardDetailsView extends StatelessWidget{
  const CardDetailsView({super.key, required this.homeModel, required this.allBooks,});
  final BookModel homeModel;
  final List<BookModel> allBooks;
  @override
  Widget build(BuildContext context){
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.a20,
          child: ListView(
            physics:const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children:[
              ContentDetailsW(homeModel:homeModel ,),
              Text("RelatedBooks".tr(),style: Styles(context).textStyle30.copyWith(fontSize: 24),),
              ListViewRelated(selectedBook: homeModel , allBooks: allBooks,),
            ],
          ),
        ),
      ),
    );
  }

}

