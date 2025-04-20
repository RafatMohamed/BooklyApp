import 'package:flutter/material.dart';
import 'app/my_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/observe_model.dart';

void main() {
  Bloc.observer=DefaultObserve();
  runApp(const BookApp());
}


