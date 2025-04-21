import 'package:bookly_app_t/features/home/views/widget_details/content_detail.dart';
import 'package:bookly_app_t/features/home/views/widgets/list_view_horz_widget.dart';
import 'package:flutter/material.dart';
import '../../../core/resources/app_padding.dart';

class CardDetailsView extends StatelessWidget{
  const CardDetailsView({super.key});

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.a20,
          child: ListView(
            physics:const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children:const[
              ContentDetailsW(),
              ListViewHorz(),
            ],
          ),
        ),
      ),
    );
  }

}

