//search
import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../../../modules/exam_package/bloc/cubit.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        onChanged: (query) {
          ExamsCubit.get(context).filterExamPackages(query);
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xffF9FAFB),
          contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Color(0xffF9FAFB)),
            borderRadius: BorderRadius.circular(12.0),
          ),
          hintText: 'Search',
          hintStyle: const TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xff9CA3AF)),
          prefixIcon: const Icon(
            IconBroken.Search,
            size: 21.0,
            color: Color(0xff9CA3AF),
          ),
        ),
      ),
    );
  }
}


