import 'package:bookly_app_t/core/resources/app_padding.dart';
import 'package:bookly_app_t/features/home/views/widgets/list_view_vert_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/widget/default_text_form_field_app.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding:  AppPadding.a20,
            child: Column(
              children: [
                TextFormFieldApp(
                  labelText: 'Search for the Books',
                  hintText: '',
                  onSubmitted: (_) {  },
                  controller: TextEditingController(),


                ),
                const SizedBox(height: 20,),
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: const [
                      ListViewVert(
                        isScroll: true,
                      ),
                    ]
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}

