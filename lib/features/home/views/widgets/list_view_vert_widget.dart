import 'package:bookly_app_t/core/resources/app_color.dart';
import 'package:bookly_app_t/features/home/data/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../model/home_cubit/home_fetch_book_cubit.dart';
import '../../model/home_cubit/home_fetch_book_state.dart';
import 'custom_best_seller_card_w.dart';

class ListViewVert extends StatelessWidget {
  const ListViewVert({super.key,  this.isScroll=false, required this.bookModel, });
  final bool isScroll;
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeFetchNewestBookCubit, HomeFetchNewestBookState>(
  builder: (context, state) {
    if(state is HomeFetchNewestBookLoading){
      return  Shimmer.fromColors(
        baseColor:  AppColor(context).whiteColor,
        highlightColor:AppColor(context).blackColor,
        child:ListView.builder(
          physics:const BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return   Column(
              children: [
                CustomCardBestSeller(homeModel:bookModel ,allBooks: [bookModel],isLoading: true,),
                const SizedBox(height: 20)
              ],
            );
          },
          itemCount: 20,
        ),
      );
    }
    else if(state is HomeFetchNewestBookFailure){
      return Center(child: Text("Error: ${state.error}"));
    }
    else if(state is HomeFetchNewestBookSuccess){

      return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: isScroll ? const BouncingScrollPhysics():const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return  Column(
            children: [CustomCardBestSeller(homeModel:state.homeModel[index] ,allBooks: state.homeModel,), const SizedBox(height: 20)],
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
