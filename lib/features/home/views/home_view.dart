import 'package:bookly_app_t/features/home/model/home_future_cubit/home_fetch_book_cubit.dart';
import 'package:bookly_app_t/features/home/views/widgets/stack_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/resources/app_padding.dart';
import '../data/book_model/book_model.dart';
import '../model/home_cubit/home_fetch_book_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.homeModel,});

  final BookModel homeModel;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      onRefresh: ()async {
        context.read<HomeFetchNewestBookCubit>().getBooks();
        context.read<HomeFetchFutureBookCubit>().getBooks();
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: AppPadding.s20T20,
            child: StackHome(homeModel: homeModel,),
          ),
        ),
      ),
    );
  }
}

