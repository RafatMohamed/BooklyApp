import 'package:bookly_app_t/core/resources/app_color.dart';
import 'package:bookly_app_t/core/resources/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/logic/save_info_person.dart';
import '../../../../core/models/auth_user.dart';
import '../../../../core/widget/image_profile.dart';
import '../../logic/register_cubit.dart';

class PickImageScreen extends StatefulWidget {
  const PickImageScreen({super.key});

  @override
  PickImageScreenState createState() => PickImageScreenState();
}

class PickImageScreenState extends State<PickImageScreen> {
  String? imagePath;
  final ImagePicker picker = ImagePicker();

  Future<void> getInfo() async {
    UserModelAuth? currentUser = await SavedInfoPerson.getInfoPerson(key: "currentUser");
    if (currentUser != null && currentUser.imageProfile != null && currentUser.imageProfile!.isNotEmpty) {
     setState(() {
       imagePath = currentUser.imageProfile;
     }
     );
   }


  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      String path = pickedFile.path;
      context.read<RegisterCubit>().pickedImagePath = path;
      // UserModelAuth? currentUser = await SavedInfoPerson.getInfoPerson(key: "currentUser");
      // if (currentUser != null) {
      //   UserModelAuth updatedUser = UserModelAuth(
      //     email: currentUser.email,
      //     password: currentUser.password,
      //     imageProfile: path,
      //   );
      //   await SavedInfoPerson.savedInfoPerson(user: updatedUser, key: "currentUser");
      //   await SavedInfoPerson.savedInfoPerson(user: updatedUser, key: updatedUser.email!);
      //   setState(() {
      //     imagePath = path;
      //   });
      // }
        setState(() {
          imagePath = path;
        });
    } else {
      print('لم يتم اختيار صورة ');
    }
  }

  void _showPickOptionsDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColor(context).blackColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder:
          (context) => Padding(
            padding: const EdgeInsets.all(20),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                ListTile(
                  leading: const Icon(Icons.photo_camera, color: Colors.blue),
                  title: Text(
                    "camera".tr(),
                    style: Styles(context).textStyle20,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.camera);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library, color: Colors.green),
                  title: Text(
                    "gallery".tr(),
                    style: Styles(context).textStyle20,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 40,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor(context).blackColor,
          ),
          onPressed: () => _showPickOptionsDialog(context),
          child: Text("chooseImage".tr(), style: Styles(context).textStyle20),
        ),
        const SizedBox(height: 20),
        CustomImagePerson.imageProfile(image: imagePath),
      ],
    );
  }
}
