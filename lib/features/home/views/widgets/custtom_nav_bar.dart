import 'package:bookly_app_t/core/constant/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import '../../../../core/helper/my_navigator_app.dart';
import '../../../../core/models/auth_user.dart';
import '../../../../core/resources/app_color.dart';
import '../../../../core/resources/app_padding.dart';
import '../../../../core/widget/image_profile.dart';
import '../../../person/views/person_view.dart';

class CustomNabBar extends StatefulWidget {
  const CustomNabBar({super.key,});
  @override
  State<CustomNabBar> createState() => _CustomNabBarState();
}

class _CustomNabBarState extends State<CustomNabBar> {
   String? profileImage;
   @override
  void initState() {
     pickImage();
    super.initState();
  }
   Future<void> pickImage() async {

   var box = await Hive.openBox<UserModelAuth>(kUserInfo);
     setState(() {
       profileImage = box.get('currentUser')!.imageProfile;
     });
   }

   @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      left: MediaQuery.sizeOf(context).width * 0.2,
      right: MediaQuery.sizeOf(context).width * 0.2,
      child: Padding(
        padding: AppPadding.e20,
        child: Container(
          padding: const EdgeInsetsDirectional.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              end: AlignmentDirectional.topStart,
              begin: AlignmentDirectional.bottomEnd,
              colors:  [AppColor(context).whiteColor.withValues(alpha:0.7) ,
                AppColor(context).blackColor.withValues(alpha:0.7)],
            ),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.book_outlined,size: 32,),
                highlightColor: AppColor(context).highlightColor,
              ),
              IconButton(
                onPressed: () {
                  AppNavigator.navigatorPush(context: context, navigatorToPage: const PersonView());
                },
                icon:CustomImagePerson.imageProfile(image: profileImage,size:40 ),
                highlightColor: AppColor(context).highlightColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
