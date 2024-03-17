import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../../../models/exam_package_model/exam_packages_model.dart';
import '../../../../modules/exam_package_details/view/exam_package_details_screen.dart';
import '../../../shared/components/colors/constants.dart';


class PackageCard extends StatelessWidget {
  final Data? model;

  const PackageCard({Key? key, this.model, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    // Check if the id is 8 and make the card invisible if true
    final bool isVisible = model?.id != 8;

    return Visibility(
      visible: isVisible,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 25),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExamPackageDetailsScreen(
                  index: index,
                  id: model?.id ?? 0,
                ),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.only(bottom: 12),
            width: 158,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.grey.shade100,
                width: 1,
              ),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      ),
                      child: Image(
                        image: NetworkImage('${model?.image}'),
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
                          top: 3,
                          bottom: 3,
                          right: 8,
                          left: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                        ),
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
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                              ),
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
                            '${model?.title}',
                            softWrap: true,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: mainColor,
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
                            IconBroken.Paper,
                            color: Color.fromRGBO(107, 114, 128, 1),
                            size: 16,
                          ),
                          Text(
                            '${model?.examsCount} Exams',
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
                      model?.discountPrice != 0
                          ? Row(
                        children: [
                          Text(
                            '\$${model?.discountPrice}',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: mainColor,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            '\$${model?.price}',
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(107, 114, 128, 1),
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      )
                          : Text(
                        '\$${model?.price}',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: mainColor,
                        ),
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
