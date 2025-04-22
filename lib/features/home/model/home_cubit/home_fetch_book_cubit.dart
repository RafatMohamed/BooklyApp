import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo.dart';
import 'home_fetch_book_state.dart';

class HomeFetchBookCubit extends Cubit<HomeFetchBookState> {
  HomeFetchBookCubit() : super(HomeFetchBookInitial());


  void getBooks() async {
    emit(HomeFetchBookLoading());
    print("Fetching books...");

    var books = await HomeRepo().fetcBooks();

    books.fold(
          (l) {
        print("Error occurred: $l");
        emit(HomeFetchBookFailure(error: l));
      },
          (r) {
        print("Books fetched successfully");
        emit(HomeFetchBookSuccess(homeModel: r));
      },
    );
  }
}
