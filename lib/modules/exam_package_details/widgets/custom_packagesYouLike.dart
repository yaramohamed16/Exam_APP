import 'package:flutter/material.dart';

import '../../../../models/exam_package_model/exam_packages_model.dart';
import '../../../../modules/exam_package_details/view/exam_package_details_screen.dart';
import '../../../../modules/exam_package_details/bloc/cubit.dart';
import '../../../shared/components/colors/constants.dart';



// ignore: must_be_immutable
class PackageYouLike extends StatelessWidget {
  Data? data;

  PackageYouLike({super.key, this.data, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final bool isVisible= data?.id !=8;
    return Visibility(
      visible:isVisible ,
      child: Padding(
        padding: const EdgeInsets.only(top: 25, bottom: 25),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ExamPackageDetailsScreen(
                          index: index,
                          id: data?.id ?? 0,
                        )));
          },
          child: Container(
            padding: const EdgeInsets.only(bottom: 12),
            width: 158,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              // Adjust the radius as needed for rounded corners
              border: Border.all(
                color: Colors.grey.shade100, // Specify border color
                width: 1, // Specify border width
              ),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15)),
                      child: Image(
                        image: NetworkImage('${data?.image}'),
                        width: 158,
                        height: 93,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 7,
                      right: 7,
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 3, bottom: 3, right: 8, left: 8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40)),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Color.fromRGBO(255, 183, 99, 1),
                              size: 12,
                            ),
                            Text(
                              '5.5',
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 158,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Text(
                            '${data?.title}',
                            softWrap: true,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              // color: mainColor
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.today_outlined,
                            color: Color.fromRGBO(107, 114, 128, 1),
                            size: 16,
                          ),
                          Text(
                            '${data?.examsCount} Exams',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(107, 114, 128, 1),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey[100],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            '\$${data?.price}',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: mainColor),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          data?.discountPrice != 0
                              ? Text(
                                  '\$${data?.discountPrice}',
                                  style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(107, 114, 128, 1),
                                      decoration: TextDecoration.lineThrough),
                                )
                              : const Text(''),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PackageLikeList extends StatelessWidget {
  const PackageLikeList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return PackageYouLike(
          data: PackageDetailsCubit.get(context).examPackagesData?.data?[index],
          // data: PackageDetailsCubit.get(context).examPackagesData?.data?[1],
          index: index,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 16,
      ),
      itemCount:
          PackageDetailsCubit.get(context).examPackagesData!.data!.length,
      // itemCount:1,
      scrollDirection: Axis.horizontal,
      // shrinkWrap: true,
    );
  }
}
