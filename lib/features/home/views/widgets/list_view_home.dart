import 'package:bookly_app_t/features/home/model/home_cubit/home_fetch_book_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/app_padding.dart';
import '../../../../core/resources/text_styles.dart';
import '../../data/book_model/book_model.dart';
import 'list_view_horz_widget.dart';
import 'list_view_vert_widget.dart';

class ListViewHome extends StatelessWidget {
  const ListViewHome({super.key, required this.homeModel});
  final BookModel homeModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeFetchBookCubit()..getBooks(),
      child: Expanded(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: [
             ListViewHorz(homeModel: homeModel,),
            const SizedBox(height: 20),
            Text("Best Seller",
                style: Styles.textStyle30.copyWith(fontSize: 24)),
            const SizedBox(height: 10),
            Padding(padding: AppPadding.e20, child: const ListViewVert()),
          ],
        ),
      ),
    );
  }
}
