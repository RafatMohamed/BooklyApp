
import 'package:bookly_app_t/core/network/api_response.dart';
import 'package:dartz/dartz.dart';
import '../../../core/network/api_helper.dart';
import '../../../core/network/end_points.dart';
import 'book_model/book_model.dart';

class HomeRepo{
  ApiHelper apiHelper=ApiHelper();
  Future <Either<String,List<BookModel>>> fetcBooks()async{
    ApiResponse response = await apiHelper.getDioRequest(
      endPoint: EndPoints.fetchBooks,
    );

    print("RESPONSE STATUS: ${response.status}");
    print("RESPONSE DATA: ${response.data}");
    print("RESPONSE MESSAGE: ${response.message}");
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