import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/app_image.dart';
import '../../data/book_model/book_model.dart';

Widget customImage({ double height = 145,required double width, required BookModel homeModel}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: CachedNetworkImage(
      fit: BoxFit.cover,
      height: height,
      width: width,
      imageUrl:"${homeModel.volumeInfo?.imageLinks?.smallThumbnail}" ,
      errorWidget: (context, url, error) =>
          Image.asset(height: height, AppImage.imageTest, fit: BoxFit.cover),
    ),
  );
}

