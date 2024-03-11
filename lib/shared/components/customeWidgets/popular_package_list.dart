import 'package:flutter/material.dart';

import '../../cubit/home_cubit/cubit.dart';
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
                index: index,
              ),
          separatorBuilder: (context, index) => const SizedBox(
                width: 15,
              ),
          itemCount: ExamsCubit.get(context).examPackagesData!.data!.length),
    );
  }
}
