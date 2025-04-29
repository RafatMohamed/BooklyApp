import 'package:bookly_app_t/core/resources/app_color.dart';
import 'package:bookly_app_t/features/home/model/home_future_cubit/home_fetch_book_cubit.dart';
import 'package:bookly_app_t/features/home/views/widgets/stack_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/resources/app_padding.dart';
import '../data/book_model/book_model.dart';
import '../model/home_cubit/home_fetch_book_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key,});


  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      color: AppColor(context).blackColor,
      backgroundColor: AppColor(context).whiteColor,
      onRefresh: ()async {
        context.read<HomeFetchNewestBookCubit>().getBooks();
        context.read<HomeFetchFutureBookCubit>().getBooks();
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: AppPadding.s20T20,
            child: const Stack(
              children: [
               StackHome(homeModel: BookModel()),
                // test how to build the BottomSheet

                // DraggableScrollableSheet(
                //   initialChildSize: 0.2,
                //   maxChildSize: 0.9,
                //   minChildSize: 0.1,
                //   controller: DraggableScrollableController(),
                //   builder:(context, scrollController) {
                //     return Container(
                //       color: Colors.transparent,
                //       width: 200,
                //       child: ListView.builder(
                //         controller: scrollController,
                //         scrollDirection: Axis.vertical,
                //         itemCount: 5,
                //         itemBuilder: (context, index) =>Column(
                //
                //           children: [
                //             Container(
                //               height: 200,
                //               width: MediaQuery.sizeOf(context).width*0.8,
                //               color: Colors.red,
                //             ),
                //             SizedBox(height: 50,),
                //           ],
                //         ) ,
                //       ),
                //     );;
                //   } ,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

