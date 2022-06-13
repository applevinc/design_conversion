import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/assets/icons.dart';
import 'package:flutter_application_1/core/assets/images.dart';
import 'package:flutter_application_1/core/constants/spacing.dart';
import 'package:flutter_application_1/ui/widgets/account_setup_card.dart';
import 'package:flutter_application_1/ui/widgets/appointment_card.dart';
import 'package:flutter_application_1/ui/widgets/invitation_card.dart';
import 'package:flutter_application_1/ui/widgets/stats_card.dart';
import 'package:flutter_application_1/ui/widgets/stats_chip.dart';
import 'package:flutter_application_1/ui/widgets/title_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final space = gap * 2;

    return Scaffold(
      backgroundColor: const Color(0xffF8FDFF),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Badge(
          elevation: 0,
          position: BadgePosition.topEnd(top: 17, end: 17),
          child: const Icon(
            Icons.notifications,
            color: Colors.black,
          ),
        ),
        title: SvgPicture.asset(
          AppIcons.logo,
          height: 3.h,
          width: 5.w,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const _InvitationCardSection(),
              SizedBox(height: space),
              const _EarningsSection(),
              SizedBox(height: space),
              const AccountSetUpCard(),
              SizedBox(height: space),
              const _AppointmentSection(),
              SizedBox(height: space),
              const _StatsSection(),
              SizedBox(height: space),
              const _WebinarSection(),
              SizedBox(height: space),
              const _UpgradeAlertSection(),
              SizedBox(height: space),
              const _ResourceCentreSection(),
              SizedBox(height: space),
            ],
          ),
        ),
      ),
    );
  }
}

class _InvitationCardSection extends StatelessWidget {
  const _InvitationCardSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: verticalSpace * 2, left: horizontalSpace),
          child: const TitleText('You have 2 invitations'),
        ),
        SizedBox(height: gap / 2),
        SizedBox(
          height: 11.h,
          child: ListView.separated(
            itemCount: 2,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: horizontalSpace),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return const InvitationCard();
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: horizontalSpace);
            },
          ),
        ),
      ],
    );
  }
}

class _EarningsSection extends StatelessWidget {
  const _EarningsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const color = Color(0xff1C71B7);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleText('Earnings'),
          SizedBox(height: gap / 2),
          Container(
            padding: EdgeInsets.all(horizontalSpace),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Available',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(height: gap / 2),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'N',
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                        ),
                        Text(
                          '25,000',
                          style: Theme.of(context).textTheme.headline5!.copyWith(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Withdraw',
                    style: Theme.of(context).textTheme.button!.copyWith(
                          color: color,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AppointmentSection extends StatelessWidget {
  const _AppointmentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalSpace),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TitleText('Appointments'),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: const [
                    Text('More'),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: gap / 2),
          const AppointmentCard(),
        ],
      ),
    );
  }
}

class _StatsSection extends StatelessWidget {
  const _StatsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalSpace),
          child: const TitleText('My Stat'),
        ),
        SizedBox(height: gap),
        SizedBox(
          height: 5.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            padding: EdgeInsets.symmetric(horizontal: horizontalSpace),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return StatChip(index);
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: horizontalSpace / 2);
            },
          ),
        ),
        SizedBox(height: gap),
        const StatsCard(),
      ],
    );
  }
}

class _WebinarSection extends StatelessWidget {
  const _WebinarSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: horizontalSpace),
      padding: EdgeInsets.all(horizontalSpace),
      decoration: BoxDecoration(
        color: Colors.white,
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
          Container(
            padding: EdgeInsets.all(horizontalSpace),
            decoration: const BoxDecoration(
              color: Color(0xff000793),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(AppIcons.videoCamera),
          ),
          SizedBox(width: 2.w),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Attend Webiner',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _UpgradeAlertSection extends StatelessWidget {
  const _UpgradeAlertSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: horizontalSpace),
      padding: EdgeInsets.all(horizontalSpace),
      decoration: BoxDecoration(
        color: Colors.white,
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
      child: Column(
        children: [
          Text(
            'Upgrade plan and Get More Invite to Match',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          SizedBox(height: gap / 4),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit dolor sit amet, dolor sit amet, consect nsect. ',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w300,
                ),
          ),
          SizedBox(height: gap / 4),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: const Color(0xff1C71B7),
              fixedSize: Size(35.w, 5.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              'Upgrade',
              style: Theme.of(context).textTheme.button!.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _ResourceCentreSection extends StatelessWidget {
  const _ResourceCentreSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalSpace),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TitleText('Resource centre'),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: const [
                    Text('More'),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30.h,
          child: ListView.separated(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: horizontalSpace),
            itemBuilder: (context, index) {
              return Image.asset(
                AppImages.articleImage,
                fit: BoxFit.cover,
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: horizontalSpace);
            },
          ),
        ),
      ],
    );
  }
}
