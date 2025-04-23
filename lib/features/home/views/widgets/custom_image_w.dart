import 'package:bookly_app_t/core/helper/notify_app.dart';
import 'package:bookly_app_t/features/home/model/home_cubit/home_fetch_book_cubit.dart';
import 'package:bookly_app_t/features/home/model/home_cubit/home_fetch_book_state.dart';
import 'package:bookly_app_t/features/home/model/home_future_cubit/home_fetch_book_cubit.dart';
import 'package:bookly_app_t/features/home/model/home_future_cubit/home_fetch_book_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/app_image.dart';
import '../../data/book_model/book_model.dart';

Widget customImage({ double height = 145,required double width, required BookModel homeModel}) {
  return BlocBuilder<HomeFetchNewestBookCubit, HomeFetchNewestBookState>(
    builder: (context, state) {
      if(state is HomeFetchNewestBookLoading){
        return AppNotify.circularProgress();
      }
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: homeModel.volumeInfo?.imageLinks?.thumbnail == null
            ? Image.asset(height: height, AppImage.imageTest, fit: BoxFit.cover)
            : Image.network(height: height,width: width,
            homeModel.volumeInfo!.imageLinks!.thumbnail,
            fit: BoxFit.cover),
      );
    },
  );
}
Widget customImageFuture({ double height = 145,required double width, required BookModel homeModel}) {
  return BlocBuilder<HomeFetchFutureBookCubit, HomeFetchFutureBookState>(
    builder: (context, state) {
      if(state is HomeFetchFutureBookLoading){
        return AppNotify.circularProgress();
      }
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: homeModel.volumeInfo?.imageLinks?.thumbnail == null
            ? Image.asset(height: height,width: width, AppImage.imageTest, fit: BoxFit.fill)
            : Image.network(height: height,
            homeModel.volumeInfo!.imageLinks!.thumbnail,
            fit: BoxFit.cover),
      );
    },
  );
}

