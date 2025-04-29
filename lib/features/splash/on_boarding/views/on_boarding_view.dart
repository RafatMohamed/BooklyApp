import 'package:bookly_app_t/core/resources/app_color.dart';
import 'package:bookly_app_t/features/home/views/home_view.dart';
import 'package:bookly_app_t/features/login/views/login_view.dart';
import 'package:bookly_app_t/features/splash/on_boarding/widgets/list_img.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import '../../../../core/constant/app_constant.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final CarouselSliderController carouselController =
      CarouselSliderController();
  int currentIndex = 0;



  Future<bool> checkIsLogin()async {
    var box = await Hive.openBox(kUserLogin);
    return  box.get('isLogin',defaultValue:  false);

  }
  Future<void> checkLoginAndNavigator({required BuildContext context}) async {
    bool isLogin = await checkIsLogin() ;
    if(context.mounted){
     await Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, _, _) {
            return  isLogin ? const  HomeView() : const LoginView();
          },
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CarouselSlider.builder(
              carouselController: carouselController,
              itemCount: imageListB.length,
              itemBuilder: (context, index, _) {
                return Image.asset(
                  imageListB[index],
                  height: size.height,
                  width: size.width,
                  fit: BoxFit.fill,
                );
              },
              options: CarouselOptions(
                height: size.height,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                scrollPhysics: const BouncingScrollPhysics(),
              ),
            ),

            Positioned(
              top: 16,
              right:context.locale == const Locale("en") ? 16:null,
              left: context.locale == const Locale("ar") ? 16:null,
              child: TextButton(
                onPressed: () async{
                  await checkLoginAndNavigator(context: context);
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColor(context).blackColor.withValues(alpha: 0.5),
                ),
                child: Text(
                  'skip'.tr(),
                  style: TextStyle(
                    color: AppColor(context).whiteColor,
                    fontSize: 14,
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(imageListB.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: currentIndex == index ? 16 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color:
                          currentIndex == index
                              ? AppColor(context).whiteColor
                              : Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  );
                }),
              ),
            ),

            Positioned(
              bottom: 0,
              left:context.locale == const Locale("en") ? 16:null,
              right: context.locale == const Locale("ar") ? 16:null,
              child: currentIndex>0 ?TextButton(
                onPressed:
                    () {
                  if(currentIndex>0){
                    carouselController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear,
                    );
                  }
                    },
                style: TextButton.styleFrom(
                  backgroundColor: AppColor(context).blackColor.withValues(alpha: 0.5),
                ),
                child: Text(
                  currentIndex > 0 ? "previous".tr():"" ,
                  style: TextStyle(
                    color: AppColor(context).whiteColor,
                    fontSize: 14,
                  ),
                ),
              ): const Text(""),
            ),

            Positioned(
              bottom: 0,
              right:context.locale == const Locale("en") ? 16:null,
              left: context.locale == const Locale("ar") ? 16:null,
              child: TextButton(
                onPressed: () async{
                  if (currentIndex == imageListB.length -1) {
                    await checkLoginAndNavigator(context: context);
                  } else {
                    carouselController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear,
                    );
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColor(context).blackColor.withValues(alpha: 0.5),
                ),
                child: Text(
                  currentIndex == imageListB.length - 1 ? "login".tr() :'next'.tr(),
                  style: TextStyle(
                    color: AppColor(context).whiteColor,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}