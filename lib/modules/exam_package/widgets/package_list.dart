//package list
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../modules/exam_package/bloc/cubit.dart';
import '../../../../modules/exam_package/bloc/states.dart';
import 'exam_package_card.dart';

class PakageList extends StatelessWidget {
  const PakageList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExamsCubit, ExamsStats>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = ExamsCubit.get(context);
        final examPackagesData = cubit.examPackagesData;
        if (state is ExamPackagesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ExamPackagesSuccess && examPackagesData != null) {
          return SizedBox(
            width: 330,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 12,
              ),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: examPackagesData.data?.length ?? 0,
              // itemCount:1,
              itemBuilder: (context, index) {
                return ExamCard(
                  model: examPackagesData.data![index],
                  // model: examPackagesData.data![1],
                  index: index,
                );
              },
            ),
          );
        } else {
          return const Center(child: Text('Failed to load data'));
        }
      },
    );
  }
}
