import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/assets/images.dart';
import 'package:flutter_application_1/core/constants/spacing.dart';
import 'package:sizer/sizer.dart';

class InvitationCard extends StatelessWidget {
  const InvitationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 92.w,
      padding: EdgeInsets.all(horizontalSpace),
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
        children: [
          Image.asset(AppImages.cup),
          SizedBox(width: 2.w),
          Flexible(
            child: RichText(
              text: TextSpan(
                text: 'Congratulations ',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                children: <TextSpan>[
                  TextSpan(
                    text:
                        'you are have been invited to be matched with a client for cleaning service.',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
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
              DottedBorder(
                padding: EdgeInsets.all(horizontalSpace / 2),
                radius: const Radius.circular(15),
                strokeWidth: 2,
                color: Colors.white,
                child: Text(
                  '02:45:05',
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.white,
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
