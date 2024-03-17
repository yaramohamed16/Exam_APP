import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../../shared/components/colors/constants.dart';
import '../bloc/cubit.dart';

class AdsWidget extends StatelessWidget {
  const AdsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    CarouselController buttonCarouselController = CarouselController();
    return Column(
      children: [
        CarouselSlider(
          carouselController: buttonCarouselController,
          items: [
            ...ExamsCubit.get(context)
                .homeAds
                ?.data!
                .map((e) => Image(
                image: NetworkImage('${e.image}')))
                .toList() ??
                [],
          ],
          options: CarouselOptions(
            viewportFraction: 1.0,
            autoPlay: true,
            autoPlayAnimationDuration: Duration(seconds: 1),
            onPageChanged: (index, reason) {
              ExamsCubit.get(context).updateIndex(index);
            },
          ),
        ),
        Center(
          child: DotsIndicator(
            dotsCount: ExamsCubit.get(context)
                .homeAds!
                .data!
                .length,
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeColor: mainColor,
              color: Colors.grey,
              spacing: const EdgeInsets.all(3.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),

            ),
            position: ExamsCubit.get(context).currentIndex,
          ),
        ),
      ],
    );
  }
}
