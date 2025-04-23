
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/my_navigator_app.dart';
import '../../../home/data/book_model/book_model.dart';
import '../../../home/views/card_details_view.dart';
import '../../../home/views/widgets/animation_select_item.dart';
import '../../model/search_cubit/search_cubit.dart';

class ListViewRelated extends StatefulWidget {
  const ListViewRelated({super.key, required this.selectedBook, required this.allBooks,});

  final BookModel selectedBook;
  final List<BookModel> allBooks;

  @override
  State<ListViewRelated> createState() => _ListViewRelatedState();
}

class _ListViewRelatedState extends State<ListViewRelated> {
  int isSelectedIndex = -1;
  ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final relatedBooks=context.read<SearchCubit>().getRelatedBooks(widget.selectedBook, widget.allBooks);
    return AspectRatio(
      aspectRatio: 1.9,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final book = relatedBooks[index];
          bool isSelected = isSelectedIndex == index;
          return GestureDetector(
            onDoubleTap: (){
              AppNavigator.navigatorPop(context: context);
              AppNavigator.navigatorPush(
                context: context,
                navigatorToPage: CardDetailsView(homeModel:book,allBooks: widget.allBooks,)
              );
            },
            onTap: () {
              setState(() {
                isSelectedIndex = isSelected ? -1 : index;
              });
            },
            child: AnimationItemCategory(
              isSelected: isSelected, homeModel: book,),
          );
        },
        itemCount: relatedBooks.length,
      ),
    );
  }
}
