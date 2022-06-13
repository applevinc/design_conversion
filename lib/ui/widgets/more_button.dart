import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            'More',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: const Color(0xff1C71B7),
                fontWeight: FontWeight.w500,
                fontSize: 15.sp),
          ),
          Icon(
            Icons.chevron_right,
            color: const Color(0xff1C71B7),
            size: 20.sp,
          ),
        ],
      ),
    );
  }
}
