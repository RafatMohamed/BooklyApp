import 'package:bookly_app_t/features/search/model/search_cubit/search_cubit.dart';
import 'package:bookly_app_t/features/search/model/search_cubit/search_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/views/widgets/custom_best_seller_card_w.dart';

class ListViewSearch extends StatelessWidget {
  const ListViewSearch({super.key,});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
         if(state is SearchStateFailure){
          return Center(child: Text("${"error".tr()}${state.error}"));
        }
        else if(state is SearchStateSuccess){
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return  Column(
                children: [CustomCardBestSeller(homeModel:state.homeModel[index], allBooks: state.homeModel,), const SizedBox(height: 20)],
              );
            },
            itemCount: state.homeModel.length,
          );
        }
        return const SizedBox();
      },
    );
  }
}
