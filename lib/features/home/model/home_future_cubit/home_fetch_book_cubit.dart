import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo.dart';
import 'home_fetch_book_state.dart';

class HomeFetchFutureBookCubit extends Cubit<HomeFetchFutureBookState> {
  HomeFetchFutureBookCubit() : super(HomeFetchFutureBookInitial());


  Future<void> getBooks() async {
    emit(HomeFetchFutureBookLoading());
    log("Fetching books...");

    var books = await HomeRepo().fetchFutureBooks();

    books.fold(
          (failure) {
            log("Error occurred: $failure");
        emit(HomeFetchFutureBookFailure(error: failure));
      },
          (bookList) {
            log("Books fetched successfully");
        emit(HomeFetchFutureBookSuccess(homeModel: bookList));
      },
    );
  }
}
