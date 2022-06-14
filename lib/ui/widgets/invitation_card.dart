import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/assets/images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvitationCard extends StatelessWidget {
  const InvitationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textHeight = 1.5;

    return Container(
      width: 335.w,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: const Color(0xff079300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(AppImages.cup),
          ),
          SizedBox(width: 12.w),
          Flexible(
            child: RichText(
              text: TextSpan(
                text: 'Congratulations ',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 13.sp,
                      height: textHeight,
                    ),
                children: <TextSpan>[
                  TextSpan(
                    text:
                        'you are have been invited to be matched with a client for cleaning service.',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          fontSize: 13.sp,
                          letterSpacing: 0.1,
                          height: textHeight,
                        ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 2.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: DottedBorder(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(5),
                  dashPattern: const [4, 3],
                  strokeWidth: 2,
                  color: Colors.white,
                  child: Text(
                    '02:45:05',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.white,
                          fontSize: 11.sp,
                        ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  ' See details',
                  style: Theme.of(context).textTheme.button!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
