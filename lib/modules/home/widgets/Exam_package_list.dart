import 'package:flutter/material.dart';

import '../../../../modules/home/bloc/cubit.dart';
import 'package_card.dart';

class ExamPackageList extends StatelessWidget {
  const ExamPackageList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 245,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => PackageCard(
          // model: ExamsCubit.get(context).examPackagesData?.data![1],
          model: ExamsCubit.get(context).examPackagesData?.data![index],
          index: index,

        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 15,
        ),
        itemCount: ExamsCubit.get(context).examPackagesData!.data!.length,
        // itemCount: 1,
      ),
    );
  }
}
