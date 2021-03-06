import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/widgets/stat_chip_buttons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatChip extends StatelessWidget {
  const StatChip({
    Key? key,
    required this.chipData,
    required this.onSelected,
  }) : super(key: key);

  final ChoiceChipData chipData;
  final Function(bool value) onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      selected: chipData.isSelected,
      onSelected: onSelected,
      label: Text(chipData.label),
      labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: chipData.isSelected ? const Color(0xff1C71B7) : null,
            fontSize: 11.sp,
            fontWeight: chipData.isSelected ? FontWeight.w700 : FontWeight.w300,
          ),
      selectedColor: const Color(0xffF8FDFF),
      backgroundColor: const Color(0xffF8FDFF),
      shape: StadiumBorder(
        side: BorderSide(
            color: chipData.isSelected ? const Color(0xff1C71B7) : Colors.black),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 26.5.w,
        vertical: 6.h,
      ),
    );
  }
}
