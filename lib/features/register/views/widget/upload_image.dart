import 'dart:io';
import 'package:bookly_app_t/core/constant/app_constant.dart';
import 'package:bookly_app_t/core/resources/app_color.dart';
import 'package:bookly_app_t/core/resources/app_image.dart';
import 'package:bookly_app_t/core/resources/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';

class PickImageScreen extends StatefulWidget {
  const PickImageScreen({super.key});

  @override
  _PickImageScreenState createState() => _PickImageScreenState();
}

class _PickImageScreenState extends State<PickImageScreen> {
  File? image;
  final ImagePicker picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });

      // تخزين المسار فقط في Hive
      var box = await Hive.openBox(kOpenImageBox);
      await box.put('profileImage', pickedFile.path);
    } else {
      print('لم يتم اختيار صورة.');
    }
  }

  void _showPickOptionsDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColor(context).blackColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_camera, color: Colors.blue),
              title: Text("camera".tr(),style: Styles(context).textStyle20,),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library, color: Colors.green),
              title: Text("gallery".tr(),style: Styles(context).textStyle20,),
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
          child: Text("chooseImage".tr(),style: Styles(context).textStyle20,),
        ),
        const SizedBox(height: 20),
        image != null
            ? ClipOval(
          child: Image.file(
            image!,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        )
            :ClipOval(
          child: Image.asset(
            AppImage.imageProfile,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
