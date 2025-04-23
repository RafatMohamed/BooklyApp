
import 'package:bookly_app_t/core/network/api_response.dart';
import 'package:dartz/dartz.dart';
import '../../../core/network/api_helper.dart';
import '../../../core/network/end_points.dart';
import 'book_model/book_model.dart';

class HomeRepo{
  ApiHelper apiHelper=ApiHelper();
  Future <Either<String,List<BookModel>>> fetchNewBooks()async{
    ApiResponse response = await apiHelper.getDioRequest(
      endPoint: EndPoints.fetchNewestBooks,
    );
      try {
        List<BookModel> itemsBook = [];
        final items = response.data['items'];
        for (var item in items) {
          itemsBook.add(BookModel.fromJson(item));
        }
        return right(itemsBook);
      } catch (e) {
        return left(e.toString());
      }
  }
  Future <Either<String,List<BookModel>>> fetchFutureBooks()async{
    ApiResponse response = await apiHelper.getDioRequest(
      endPoint: EndPoints.fetchFutureBooks,
    );
      try {
        List<BookModel> itemsBook = [];
        final items = response.data['items'];
        for (var item in items) {
          itemsBook.add(BookModel.fromJson(item));
        }
        return right(itemsBook);
      } catch (e) {
        return left(e.toString());
      }
  }

}