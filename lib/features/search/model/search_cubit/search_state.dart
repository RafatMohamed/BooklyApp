import '../../../home/data/book_model/book_model.dart';

class SearchState {}

final class SearchStateInitial extends SearchState {}
final class SearchStateSuccess extends SearchState {
  List<BookModel> homeModel;
  SearchStateSuccess({required this.homeModel});
}
final class SearchStateFailure extends SearchState {
 String error;
  SearchStateFailure({required this.error});
}
