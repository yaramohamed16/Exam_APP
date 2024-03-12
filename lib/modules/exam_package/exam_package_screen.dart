import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/colors/constants.dart';
import '../../shared/components/customeWidgets/appBar/custome_app_bar.dart';
import '../../shared/components/customeWidgets/exam_package_widgets/packages_list/package_list.dart';
import '../../shared/components/customeWidgets/exam_package_widgets/search/search_section.dart';
import '../../shared/cubit/exam_package_cubit/cubit.dart';
import '../../shared/cubit/exam_package_cubit/states.dart';

class PackageScreen extends StatelessWidget {
  const PackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ExamsCubit()..getExamPackages(),
      child: BlocConsumer<ExamsCubit, ExamsStats>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: appBarCustom(pageName: "Exam Packages", context: context),
            body: ExamsCubit.get(context).examPackagesData != null
                ? SingleChildScrollView(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: 24, end: 24),
                      child: Column(
                        children: [
                          const SearchSection(),
                          const SizedBox(
                            height: 32,
                          ),
                          Container(
                            height: 0.5,
                            width: double.infinity,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                'Main Packages',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color(0xff020939),
                                  letterSpacing: -0.3,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const PakageList(),
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(
                    color: mainColor,
                  )),
          );
        },
      ),
    );
  }
}
