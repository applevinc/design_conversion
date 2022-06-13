import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/assets/images.dart';
import 'package:flutter_application_1/core/constants/spacing.dart';
import 'package:sizer/sizer.dart';

class AccountSetUpCard extends StatelessWidget {
  const AccountSetUpCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalSpace),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              top: verticalSpace,
              left: horizontalSpace,
              bottom: verticalSpace,
            ),
            decoration: BoxDecoration(
              color: const Color(0xff4289C3),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Complete Account Setup',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: gap / 2),
                SizedBox(
                  width: 60.w,
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 5,
            child: Image.asset(
              AppImages.accSetUp,
              height: 10.h,
            ),
          ),
        ],
      ),
    );
  }
}
