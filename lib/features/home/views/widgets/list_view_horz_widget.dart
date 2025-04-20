import 'package:flutter/material.dart';

import '../../../../core/resources/app_image.dart';

class ListViewHorz extends StatefulWidget {
  const ListViewHorz({super.key});

  @override
  State<ListViewHorz> createState() => _ListViewHorzState();
}

class _ListViewHorzState extends State<ListViewHorz> {
  int isSelectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 1 / 4,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: ScrollController(),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          bool isSelected = isSelectedIndex == index;
          return Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isSelectedIndex = isSelected ? 0 : index;
                  });
                },
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    transform: isSelected
                        ? Matrix4.identity().scaled(1.1)
                        : Matrix4.identity(),
                    child:Image.asset(AppImage.imageTest,)
                ),
              ),
              const SizedBox(width: 5),
            ],
          );
        },
        itemCount: 10,
      ),
    );
  }
}