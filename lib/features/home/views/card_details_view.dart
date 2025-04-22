import 'package:bookly_app_t/features/home/views/widget_details/content_detail.dart';
import 'package:bookly_app_t/features/home/views/widgets/list_view_horz_widget.dart';
import 'package:flutter/material.dart';
import '../../../core/resources/app_padding.dart';
import '../data/book_model/book_model.dart';

class CardDetailsView extends StatelessWidget{
  const CardDetailsView({super.key, required this.homeModel,});
  final BookModel homeModel;
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
              ListViewHorz(homeModel: homeModel),
            ],
          ),
        ),
      ),
    );
  }

}

