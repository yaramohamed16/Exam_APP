import 'package:flutter/material.dart';
import '../../../../models/exam_package_model/exam_packages_model.dart';
import '../../../../modules/exam_package_details/view/exam_package_details_screen.dart';
import '../../../shared/components/colors/constants.dart';


class ExamCard extends StatelessWidget {
  final Data? model;

  const ExamCard({super.key, this.model, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final bool isVisible = model?.id != 8;
    return Visibility(
      visible: isVisible,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ExamPackageDetailsScreen(
                      index: index, id: model?.id ?? 0)));
        },
        child: Container(
          width: 328,
          height: 172,
          decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffF3F4F6),
              ),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: Image(
                      image: NetworkImage('${model?.image}'),
                      fit: BoxFit.cover,
                      width: 328,
                      height: 95,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 10.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: examBox,
                            borderRadius: BorderRadius.circular(50)),
                        width: 30,
                        height: 29,
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5.5),
                              child: Icon(
                                Icons.favorite_border,
                                size: 17,
                                color: Color(0xffE40505),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 265, top: 10.0),
                    // padding: const EdgeInsets.only(top: 4,right:  6, bottom: 4 , left:6 ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: examBox,
                            borderRadius: BorderRadius.circular(40)),
                        width: 44,
                        height: 20,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.star,
                                color: Colors.yellow.shade800,
                                size: 14,
                              ),
                            ),
                            const Text("5.5"),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${model?.title}',
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                      color: Color(0xff020939),
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.list_alt,
                      size: 17,
                      color: smallDescriptionText,
                    ),
                    Text(
                      ' ${model?.examsCount} Exams',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis,
                          color: smallDescriptionText),
                      maxLines: 1,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      "\$${model?.price}",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: mainColor),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    if (model?.discountPrice != 0)
                      Text(
                        "\$${model?.discountPrice}",
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: smallDescriptionText,
                            decoration: TextDecoration.lineThrough),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
