import '../../data/book_model/book_model.dart';

class HomeFetchFutureBookState {}

final class HomeFetchFutureBookInitial extends HomeFetchFutureBookState {}
final class HomeFetchFutureBookLoading extends HomeFetchFutureBookState {}
final class HomeFetchFutureBookSuccess extends HomeFetchFutureBookState {
  List<BookModel> homeModel;
  HomeFetchFutureBookSuccess({required this.homeModel});
}
final class HomeFetchFutureBookFailure extends HomeFetchFutureBookState {
 String error;
  HomeFetchFutureBookFailure({required this.error});
}
