import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/assets/images.dart';
import 'package:flutter_application_1/core/constants/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard(this.index, {Key? key}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffBBC1C7)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: 25.5.h,
                right: 20.w,
                left: 20.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const _ServiceTitleSection(),
                  SizedBox(height: gap),
                  const _AppointmentTime(),
                  SizedBox(height: gap),
                  const _ServiceProviderInfoSection(),
                ],
              ),
            ),
          ),
          Container(
            width: 335.w,
            color: const Color(0xff1C71B7).withOpacity(.15),
            padding: EdgeInsets.symmetric(
              horizontal: horizontalSpace,
              vertical: verticalSpace / 2,
            ),
            alignment: Alignment.centerRight,
            child: Text(
              '${index + 1}/3',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                    color: const Color(0xff1C71B7),
                  ),
            ),
          )
        ],
      ),
    );
  }
}

class _ServiceTitleSection extends StatelessWidget {
  const _ServiceTitleSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cleaning service',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 15.sp,
                  ),
            ),
            Text(
              'Deep cleaning',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w300,
                    fontSize: 11.sp,
                  ),
            ),
          ],
        ),
        Text(
          'Upcoming',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w700,
                color: const Color(0xff1C71B7),
              ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          alignment: Alignment.centerRight,
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
      ],
    );
  }
}

class _AppointmentTime extends StatelessWidget {
  const _AppointmentTime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Today',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
              ),
        ),
        Text(
          '12:00 PM',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w300,
                fontSize: 11.sp,
              ),
        ),
      ],
    );
  }
}

class _ServiceProviderInfoSection extends StatelessWidget {
  const _ServiceProviderInfoSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 10.88.h),
          decoration: BoxDecoration(
            color: const Color(0xffF4F4F4),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const _ValueColumn(
                label: 'Value',
                value: 'N6,500',
              ),
              SizedBox(width: horizontalSpace),
              Container(
                height: gap * 2,
                width: 1,
                color: const Color(0xffB3D0E7),
              ),
              SizedBox(width: horizontalSpace),
              const _ValueColumn(
                label: 'Member',
                value: '1',
              ),
            ],
          ),
        ),
        Column(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage(AppImages.smallAvatar),
            ),
            Text(
              'Nkechi E.',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w300,
                    fontSize: 13.sp,
                  ),
            ),
            Row(
              children: [
                Text(
                  '4.8(23)',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                      ),
                ),
                const Icon(
                  Icons.star,
                  color: Color(0xffF4B400),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _ValueColumn extends StatelessWidget {
  const _ValueColumn({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w300,
                fontSize: 13.sp,
                color: const Color(0xff061725),
              ),
        ),
        SizedBox(height: 8.h),
        Text(
          value,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 15.sp,
                color: const Color(0xff061725),
              ),
        ),
      ],
    );
  }
}
