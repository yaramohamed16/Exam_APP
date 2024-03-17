//package_details

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/colors/constants.dart';

import '../../../shared/components/customeWidgets/grey_line/custom_line.dart';
import '../../../shared/components/customeWidgets/appBar/custome_app_bar.dart';

import '../bloc/cubit.dart';
import '../bloc/state.dart';
import '../widgets/custom_exam_page_components.dart';
import '../widgets/custom_packagesYouLike.dart';

class ExamPackageDetailsScreen extends StatelessWidget {
  const ExamPackageDetailsScreen(
      {super.key, required int index, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PackageDetailsCubit()
        ..getExamPackages(id: id)
        ..getExamPackage(),
      child: BlocConsumer<PackageDetailsCubit, PackageDetailsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = PackageDetailsCubit.get(context);

          return Scaffold(
            appBar: appBarCustom(pageName: "Package Details", context: context),
            body: cubit.detailsModel != null && cubit.examPackagesData != null
                ? SingleChildScrollView(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: 24, end: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 0.5,
                            width: double.infinity,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(top: 24),
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.network(
                                  '${cubit.detailsModel!.data!.image}',
                                  width: double.infinity,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Text(
                            '${cubit.detailsModel!.data!.title}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '\$${cubit.detailsModel!.data!.price}',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: mainColor),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: smallDescriptionText,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              cubit.detailsModel!.data!.discountPrice != 0
                                  ? Text(
                                      'Disc. ${cubit.detailsModel!.data!.discountPrice}',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: smallDescriptionText,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    )
                                  : const Text(""),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const CustomLine(),
                          const SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            width: 330,
                            child: Text(
                              '${cubit.detailsModel!.data!.description}',
                              maxLines: 3,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  overflow: TextOverflow.ellipsis,
                                  color: smallDescriptionText),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "See full description",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: mainColor),
                              ),
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => SimpleDialog(
                                      backgroundColor: Colors.white,
                                      title: const Text("Description"),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 12.0, horizontal: 20.0),
                                      // Adjust padding here
                                      children: [
                                        SizedBox(
                                          height: 300,
                                          // Adjust height of the SimpleDialog content
                                          child: SingleChildScrollView(
                                            // Add SingleChildScrollView for scrollability if needed
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${cubit.detailsModel!.data!.description}',
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    // You can adjust the font size here if needed
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        // Add space between text and Close button
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                "Close",
                                                style:
                                                    TextStyle(color: mainColor),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: smallDescriptionText,
                                  size: 16,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const CustomLine(),
                          (cubit.isShown)
                              ? const SizedBox(
                                  height: 10,
                                )
                              : const SizedBox(
                                  height: 10,
                                ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Exams",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: mainColor),
                              ),
                              IconButton(
                                onPressed: () {
                                  cubit.examsList();
                                },
                                icon: (cubit.isShown)
                                    ? Icon(
                                        Icons.keyboard_arrow_up_outlined,
                                        color: mainColor,
                                        size: 25,
                                      )
                                    : Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: smallDescriptionText,
                                        size: 25,
                                      ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          if (cubit.isShown)
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: examBox,
                                    borderRadius: BorderRadius.circular(20)),
                                width: 330,
                                child: const ExamListView(),
                              ),
                            ),
                          if (cubit.isShown)
                            const SizedBox(
                              height: 10,
                            ),
                          const CustomLine(),
                          const SizedBox(
                            height: 24,
                          ),
                          const Text(
                            "Packages you might like",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const SizedBox(
                            height: 260,
                            child: PackageLikeList(),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(
                      color: mainColor,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
