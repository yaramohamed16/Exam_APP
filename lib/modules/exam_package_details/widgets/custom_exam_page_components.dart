//shared components

import 'package:exams_app/models/exam_overview_model/examOverViewModel.dart';
import 'package:flutter/material.dart';


import '../../../../modules/exam_overview/view/exam_overview_page.dart';
import '../../../../modules/exam_package_details/bloc/cubit.dart';
import '../../../shared/components/colors/constants.dart';



class ExamListView extends StatelessWidget {
  const ExamListView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = PackageDetailsCubit.get(context).detailsModel?.data?.exams;
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ExamList(exams: cubit[index]);
      },
      separatorBuilder: (context, index) => Center(
        child: Container(
          height: 0.5,
          width: 330,
          color: Colors.grey.withOpacity(0.4),
        ),
      ),
      itemCount: cubit!.length,
      shrinkWrap: true,
      // scrollDirection: Axis.vertical,
    );
  }
}

// ignore: must_be_immutable
class ExamList extends StatelessWidget {
  ExamsOverview? exams;

  ExamList({super.key, this.exams});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ExamOverviewPage(exams: exams)));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 10, top: 10),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: iconBackgroundColor,
                  child: Icon(
                    Icons.message_outlined,
                    size: 18,
                    color: mainColor,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${exams?.title}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${exams?.questionsCount} Questions",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: smallDescriptionText),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          // const SizedBox(
          //   height: 24,
          // ),
        ],
      ),
    );
  }
}

