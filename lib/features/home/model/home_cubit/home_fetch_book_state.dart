import '../../data/book_model/book_model.dart';

class HomeFetchNewestBookState {}

final class HomeFetchNewestBookInitial extends HomeFetchNewestBookState {}
final class HomeFetchNewestBookLoading extends HomeFetchNewestBookState {}
final class HomeFetchNewestBookSuccess extends HomeFetchNewestBookState {
  List<BookModel> homeModel;
  HomeFetchNewestBookSuccess({required this.homeModel});
}
final class HomeFetchNewestBookFailure extends HomeFetchNewestBookState {
 String error;
  HomeFetchNewestBookFailure({required this.error});
}
