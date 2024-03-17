import 'package:flutter/material.dart';

import '../../../../modules/home/bloc/cubit.dart';
import 'package_card.dart';

class PopularPackageList extends StatelessWidget {
  const PopularPackageList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 245,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => PackageCard(
          model: ExamsCubit.get(context).examPackagesData?.data![index],
          // model: ExamsCubit.get(context).examPackagesData?.data![1],
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
