import 'package:bookly_app_t/core/helper/my_navigator_app.dart';
import 'package:bookly_app_t/features/home/model/home_future_cubit/home_fetch_book_cubit.dart';
import 'package:bookly_app_t/features/home/model/home_future_cubit/home_fetch_book_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/app_color.dart';
import '../../data/book_model/book_model.dart';
import '../card_details_view.dart';
import 'animation_select_item.dart';
import "package:shimmer/shimmer.dart";

class ListViewHorz extends StatefulWidget {
  const ListViewHorz({super.key, required this.homeModel,});

  final BookModel homeModel;

  @override
  State<ListViewHorz> createState() => _ListViewHorzState();
}

class _ListViewHorzState extends State<ListViewHorz> {
  int isSelectedIndex = 0;
  ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.9,
      child: BlocBuilder<HomeFetchFutureBookCubit, HomeFetchFutureBookState>(
        builder: (context, state) {
          if(state is HomeFetchFutureBookLoading){
            return Shimmer.fromColors(
              baseColor:  AppColor(context).whiteColor,
              highlightColor:AppColor(context).blackColor,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  bool isSelected = isSelectedIndex == index;
                  return AnimationItemCategory(
                    isSelected: isSelected, homeModel: widget.homeModel,
                  );
                },
                itemCount: 20,
              ),
            );
          }
          else if(state is HomeFetchFutureBookFailure){
            return Center(child: Text("Error: ${state.error}"));
          }
          else if(state is HomeFetchFutureBookSuccess){
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: scrollController,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                bool isSelected = isSelectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelectedIndex = isSelected ? 0 : index;
                    });
                  },
                  onDoubleTap: (){
                    AppNavigator.navigatorPushGo(navigatorToPage: () {
                      return  CardDetailsView(homeModel:state.homeModel[index],allBooks: state.homeModel,);
                    },);
                  },
                  child: AnimationItemCategory(
                    isSelected: isSelected, homeModel: state.homeModel[index],),
                );
              },
              itemCount: state.homeModel.length,
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
