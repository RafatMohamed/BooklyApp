import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo.dart';
import 'home_fetch_book_state.dart';

class HomeFetchNewestBookCubit extends Cubit<HomeFetchNewestBookState> {
  HomeFetchNewestBookCubit() : super(HomeFetchNewestBookInitial());


  Future<void> getBooks() async {
    emit(HomeFetchNewestBookLoading());
    log("Fetching books...");

    var books = await HomeRepo().fetchNewBooks();

    books.fold(
          (failure) {
            log("Error occurred: $failure");
        emit(HomeFetchNewestBookFailure(error: failure));
      },
          (bookList) {
            log("Books fetched successfully");
        emit(HomeFetchNewestBookSuccess(homeModel: bookList));
      },
    );
  }
}
