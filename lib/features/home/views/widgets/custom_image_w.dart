import 'package:flutter/cupertino.dart';

import '../../../../core/resources/app_image.dart';
import '../../data/book_model/book_model.dart';

Widget customImage({ double height=145, required BookModel homeModel}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child:homeModel.volumeInfo?.imageLinks?.thumbnail==null
        ? Image.asset(height: height, AppImage.imageTest, fit: BoxFit.cover)
        :Image.network(height: height, homeModel.volumeInfo!.imageLinks!.thumbnail, fit: BoxFit.cover),
  );
}
