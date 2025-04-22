import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helper/notify_app.dart';
import '../../model/home_cubit/home_fetch_book_cubit.dart';
import '../../model/home_cubit/home_fetch_book_state.dart';
import 'custom_best_seller_card_w.dart';

class ListViewVert extends StatelessWidget {
  const ListViewVert({super.key,  this.isScroll=false});
  final bool isScroll;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeFetchBookCubit, HomeFetchBookState>(
  builder: (context, state) {
    if(state is HomeFetchBookLoading){
      return AppNotify.circularProgress();
    }else if(state is HomeFetchBookFailure){
      return Center(child: Text("Error: ${state.error}"));
    }
    else if(state is HomeFetchBookSuccess){

      return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: isScroll ? const BouncingScrollPhysics():const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return  Column(
            children: [CustomCardBestSeller(homeModel:state.homeModel[index] ), const SizedBox(height: 20)],
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
