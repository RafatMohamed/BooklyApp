
import 'package:bookly_app_t/core/network/api_response.dart';
import 'package:dartz/dartz.dart';
import '../../../core/network/api_helper.dart';
import '../../../core/network/end_points.dart';
import '../../home/data/book_model/book_model.dart';

class SearchRepo{
  ApiHelper apiHelper=ApiHelper();
  Future <Either<String,List<BookModel>>> getSearch({required String query })async{
    ApiResponse response = await apiHelper.getDioRequest(
      endPoint: "${EndPoints.searchBooks}$query&maxResults=20",
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