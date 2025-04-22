import '../../data/book_model/book_model.dart';

class HomeFetchBookState {}

final class HomeFetchBookInitial extends HomeFetchBookState {}
final class HomeFetchBookLoading extends HomeFetchBookState {}
final class HomeFetchBookSuccess extends HomeFetchBookState {
  List<BookModel> homeModel;
  HomeFetchBookSuccess({required this.homeModel});
}
final class HomeFetchBookFailure extends HomeFetchBookState {
 String error;
  HomeFetchBookFailure({required this.error});
}
