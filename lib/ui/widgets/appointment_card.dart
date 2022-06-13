import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/assets/images.dart';
import 'package:flutter_application_1/core/constants/spacing.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffBBC1C7)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: verticalSpace,
              right: horizontalSpace,
              left: horizontalSpace,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _ServiceTitleSection(),
                SizedBox(height: gap),
                const _AppointmentTime(),
                SizedBox(height: gap),
                const _ProviderInfoSection(),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: const Color(0xff1C71B7).withOpacity(.15),
            padding: EdgeInsets.symmetric(
              horizontal: horizontalSpace,
              vertical: verticalSpace / 2,
            ),
            alignment: Alignment.centerRight,
            child: Text(
              '2/3',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.w700, color: const Color(0xff1C71B7)),
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
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              'Deep cleaning',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.w300),
            ),
          ],
        ),
        Text(
          'Upcoming',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w700, color: Colors.blue),
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
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          '12:00 PM',
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}

class _ProviderInfoSection extends StatelessWidget {
  const _ProviderInfoSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(horizontalSpace),
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
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.w300),
            ),
            Row(
              children: [
                Text(
                  '4.8(23)',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.w700),
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
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontWeight: FontWeight.w300),
        ),
        SizedBox(height: gap / 2),
        Text(
          value,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
