import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/data/book_model/book_model.dart';
import '../../data/repo.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchStateInitial());
  TextEditingController searchController= TextEditingController();
  void getBooks({required String query}) async {
    log("fetching".tr());
    var books = await SearchRepo().getSearch(query: query);
    books.fold(
          (failure) {
            log("${"errorOccurred".tr()} $failure".tr());
        emit(SearchStateFailure(error: failure));
      },
          (bookList) {
            log("booksFetchedSuccessfully".tr());
        emit(SearchStateSuccess(homeModel: bookList));
      },
    );
  }
  List<BookModel> getRelatedBooks(BookModel selectedBook, List<BookModel> allBooks) {
    return allBooks.where((book) {
      if (book.id == selectedBook.id) return false;

      final selectedCategories = selectedBook.volumeInfo?.categories?.map((e) => e.toLowerCase()) ?? [];
      final bookCategories = book.volumeInfo?.categories?.map((e) => e.toLowerCase()) ?? [];

      bool hasCommonCategory = selectedCategories.any((cat) => bookCategories.contains(cat));
      bool hasSimilarTitle = book.volumeInfo!.title!.toLowerCase().contains(
        selectedBook.volumeInfo!.title!.toLowerCase().split(' ').first,
      );

      return hasCommonCategory || hasSimilarTitle;
    }).toList();
  }
}
