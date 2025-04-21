import 'package:flutter/material.dart';

abstract class AppPadding{
  static final EdgeInsetsGeometry s20T20 = const EdgeInsetsDirectional.only(
      start: 20,
      top: 20,
  );
  static final EdgeInsetsGeometry e20 = const EdgeInsetsDirectional.only(
      end: 20,
  );
  static final EdgeInsetsGeometry a20 = const EdgeInsetsDirectional.all(
    20,
  );
}