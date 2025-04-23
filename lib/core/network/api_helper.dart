import 'dart:developer';
import 'package:dio/dio.dart';

import 'api_response.dart';
import 'end_points.dart';

class ApiHelper {
  ApiHelper._internal();
  static final ApiHelper _instance = ApiHelper._internal();

  factory ApiHelper() {
    return _instance;
  }
  Dio dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 12),
      receiveTimeout: const Duration(seconds: 15),
    ),
  )..interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
         log('Path: ${options.path}');
         log('Method: ${options.method}');
         log('Headers: ${options.headers}');
         log('Data: ${options.data}');
        return handler.next(options);
      },
    ),
  );




  //getDio
  Future<ApiResponse> getDioRequest(
      {required String endPoint,
        Map<String, dynamic>? data,
      }) async {
    try {
      var response = await dio.get(
          "${EndPoints.baseUrl}$endPoint",
          data: data,
      );
      return ApiResponse.fromResponse(response);
    } catch (e) {
      return ApiResponse.fromError(e);
    }
  }

// class ApiHelper{
//   Dio dio=Dio(
//     BaseOptions(
//       baseUrl: EndPoints.baseUrl,
//     )
//   );
//
//   Future<ApiResponse> gitDio({required String endPoint })async{
//    var response = await dio.get(endPoint,);
//    try{
//      return ApiResponse.fromResponse(response);
//    }catch(e){
//      return ApiResponse.fromError(e);
//    }
// }
// }


}
abstract class LocalData {
  static String? accessToken;
}