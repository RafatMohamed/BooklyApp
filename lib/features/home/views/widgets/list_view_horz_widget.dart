import 'package:flutter/material.dart';
import 'animation_select_item.dart';

class ListViewHorz extends StatefulWidget {
  const ListViewHorz({super.key});

  @override
  State<ListViewHorz> createState() => _ListViewHorzState();
}

class _ListViewHorzState extends State<ListViewHorz> {
  int isSelectedIndex = 0;
  ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.9,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: scrollController,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          bool isSelected = isSelectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                isSelectedIndex = isSelected ? 0 : index;
              });
            },
            child: AnimationItemCategory(isSelected: isSelected),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
