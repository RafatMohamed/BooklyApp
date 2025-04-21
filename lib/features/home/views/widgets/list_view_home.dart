import 'package:flutter/cupertino.dart';
import '../../../../core/resources/app_padding.dart';
import '../../../../core/resources/text_styles.dart';
import 'list_view_horz_widget.dart';
import 'list_view_vert_widget.dart';

class ListViewHome extends StatelessWidget {
  const ListViewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          const ListViewHorz(),
          const SizedBox(height: 20),
          Text("Best Seller", style: Styles.textStyle30.copyWith(fontSize: 24)),
          const SizedBox(height: 10),
          Padding(padding: AppPadding.e20, child: const ListViewVert()),
        ],
      ),
    );
  }
}
