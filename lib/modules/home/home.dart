import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../shared/components/colors/constants.dart';
import '../../shared/components/customeWidgets/home_widgets/package_list/Exam_package_list.dart';
import '../../shared/components/customeWidgets/home_widgets/popular_list/popular_package_list.dart';
import '../../shared/cubit/home_cubit/cubit.dart';
import '../../shared/cubit/home_cubit/states.dart';
import '../exam_package/exam_package_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    CarouselController buttonCarouselController = CarouselController();
    return BlocProvider(
      create: (BuildContext context) => ExamsCubit()
        ..getExamPackages()
        ..getHomeAds(),
      child: BlocConsumer<ExamsCubit, ExamsStats>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: ExamsCubit.get(context).examPackagesData != null && ExamsCubit.get(context).homeAds !=null

                ? SingleChildScrollView(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 72, right: 24, left: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Morning,',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 24,
                                  color: titleColor,
                                ),
                              ),
                              Text(
                                ' Ahmed 🌞',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 24,
                                    color: mainColor),
                              )
                            ],
                          ),
                          const Text(
                            'What do you want to learn today?',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color.fromRGBO(75, 85, 99, 1)),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
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
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              Text(
                                'Popular Packages',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: titleColor),
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PackageScreen()));
                                },
                                child: Text(
                                  'View all',
                                  style: TextStyle(
                                      color: mainColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          const PopularPackageList(),
                          Row(
                            children: [
                              Text(
                                'Exam Packages',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: titleColor),
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PackageScreen()));
                                },
                                child: Text(
                                  'View all',
                                  style: TextStyle(
                                      color: mainColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          const ExamPackageList(),
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(
                    color: mainColor,
                  )),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: mainColor,
              unselectedItemColor: iconColor,
              backgroundColor: Colors.white,
              elevation: 2,
              iconSize: 24,
              selectedLabelStyle:
                  const TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
              unselectedLabelStyle:
                  const TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.Home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      IconBroken.Video,
                    ),
                    label: 'My Exams'),
                BottomNavigationBarItem(
                    icon: Icon(
                      IconBroken.Profile,
                    ),
                    label: 'Profile'),
              ],
            ),
          );
        },
      ),
    );
  }
}
