import 'package:bookly_app_t/core/resources/app_color.dart';
import 'package:bookly_app_t/features/splash/on_boarding/widgets/list_img.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../register/views/register_view.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final CarouselSliderController carouselController =
      CarouselSliderController();
  int currentIndex = 0;

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
                viewportFraction: 0.9,
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
              right: 16,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, _, _) {
                        return const RegisterView();
                      },
                    ),
                  );
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: AppColor(context).highlightColor,
                    fontSize: 16,
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
              left: 16,
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
                  backgroundColor: AppColor(context).highlightColor,
                ),
                child: Text(
                  currentIndex > 0 ? "previous":"" ,
                  style: TextStyle(
                    color: AppColor(context).whiteColor,
                    fontSize: 16,
                  ),
                ),
              ): const Text(""),
            ),

            Positioned(
              bottom: 0,
              right: 16,
              child: TextButton(
                onPressed: () {
                  if (currentIndex == imageListB.length -1) {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder:
                            (context, animation, secondaryAnimation) =>
                                const RegisterView(),
                      ),
                    );
                  } else {
                    carouselController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear,
                    );
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColor(context).highlightColor,
                ),
                child: Text(
                  currentIndex == imageListB.length - 1 ? "login " :'Next',
                  style: TextStyle(
                    color: AppColor(context).whiteColor,
                    fontSize: 16,
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
