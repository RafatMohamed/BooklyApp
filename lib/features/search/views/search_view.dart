import 'package:bookly_app_t/core/resources/app_padding.dart';
import 'package:bookly_app_t/features/search/model/search_cubit/search_cubit.dart';
import 'package:bookly_app_t/features/search/views/widgets/list_view_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/resources/text_styles.dart';
import '../../../core/widget/default_text_form_field_app.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key,});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          final cubit=context.read<SearchCubit>();
          return SafeArea(
              child: Padding(
                padding:  AppPadding.a20,
                child: Column(
                  children: [
                    TextFormFieldApp(
                      labelText: 'search'.tr(),
                      hintText: '',
                      onChange: (value) {
                        cubit.searchController.text=value;
                        cubit.getBooks(query: value);
                      },
                      controller: cubit.searchController,
                    ),
                    const SizedBox(height: 20,),
                    Text("searchResult".tr(), style: Styles(context).textStyle30.copyWith(fontSize: 24)),
                    const SizedBox(height: 10,),
                    Expanded(
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children:  const[
                          ListViewSearch(),
                        ]
                      ),
                    ),
                  ],
                ),
              ),
          );
        }
      ),
    );
  }
}

