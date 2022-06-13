import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/spacing.dart';
import 'package:flutter_application_1/ui/widgets/stats_chip.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChoiceChipData {
  final String label;
  final bool isSelected;
  Color textColor;
  Color selectedColor;

  ChoiceChipData({
    required this.label,
    required this.isSelected,
    required this.textColor,
    required this.selectedColor,
  });

  ChoiceChipData copy({
    String? label,
    bool? isSelected,
    Color? textColor,
    Color? selectedColor,
  }) =>
      ChoiceChipData(
        label: label ?? this.label,
        isSelected: isSelected ?? this.isSelected,
        textColor: textColor ?? this.textColor,
        selectedColor: selectedColor ?? this.selectedColor,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChoiceChipData &&
          runtimeType == other.runtimeType &&
          label == other.label &&
          isSelected == other.isSelected &&
          textColor == other.textColor &&
          selectedColor == other.selectedColor;

  @override
  int get hashCode =>
      label.hashCode ^ isSelected.hashCode ^ textColor.hashCode ^ selectedColor.hashCode;
}

class ChoiceChips {
  static final all = <ChoiceChipData>[
    ChoiceChipData(
      label: 'Today',
      isSelected: false,
      selectedColor: Colors.blue,
      textColor: Colors.white,
    ),
    ChoiceChipData(
      label: 'Week',
      isSelected: false,
      selectedColor: Colors.blue,
      textColor: Colors.white,
    ),
    ChoiceChipData(
      label: 'May',
      isSelected: false,
      selectedColor: Colors.blue,
      textColor: Colors.white,
    ),
    ChoiceChipData(
      label: '2021',
      isSelected: false,
      selectedColor: Colors.blue,
      textColor: Colors.white,
    ),
  ];
}

class StatChipButtons extends StatefulWidget {
  const StatChipButtons({
    Key? key,
  }) : super(key: key);

  @override
  State<StatChipButtons> createState() => _StatChipButtonsState();
}

class _StatChipButtonsState extends State<StatChipButtons> {
  List<ChoiceChipData> choiceChips = ChoiceChips.all;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: horizontalSpace),
        children: choiceChips.map(
          (choiceChip) {
            return Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: StatChip(
                chipData: choiceChip,
                onSelected: (isSelected) => setState(() {
                  choiceChips = choiceChips.map((otherChip) {
                    final newChip = otherChip.copy(isSelected: false);

                    return choiceChip == newChip
                        ? newChip.copy(isSelected: isSelected)
                        : newChip;
                  }).toList();
                }),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
