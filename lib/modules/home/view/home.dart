import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:exams_app/modules/home/widgets/ads_widget.dart';
import 'package:exams_app/modules/home/widgets/welcome_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../../shared/components/colors/constants.dart';

import '../bloc/cubit.dart';
import '../bloc/states.dart';
import '../../exam_package/view/exam_package_screen.dart';
import '../widgets/Exam_package_list.dart';
import '../widgets/bottom_navigation_widget.dart';
import '../widgets/popular_package_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
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
                          const WelcomeText(),
                          AdsWidget(),
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
                                    color: mainColor),
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
                                    color: mainColor),
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
            bottomNavigationBar: BottomNavigationWidget(),
          );
        },
      ),
    );
  }
}
