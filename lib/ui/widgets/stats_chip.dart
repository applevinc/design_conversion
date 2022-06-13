import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/spacing.dart';

class StatChip extends StatelessWidget {
  const StatChip(
    this.index, {
    Key? key,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      selected: index == 1 ? true : false,
      onSelected: (value) {},
      label: const Text('Today'),
      labelStyle: Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(color: index == 1 ? Colors.blue : null),
      selectedColor: const Color(0xffF8FDFF),
      backgroundColor: const Color(0xffF8FDFF),
      shape: StadiumBorder(
        side: BorderSide(color: index == 1 ? Colors.blue : Colors.black),
      ),
      padding: EdgeInsets.symmetric(horizontal: horizontalSpace * 2),
    );
  }
}