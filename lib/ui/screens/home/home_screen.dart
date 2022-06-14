import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/assets/icons.dart';
import 'package:flutter_application_1/core/assets/images.dart';
import 'package:flutter_application_1/core/constants/spacing.dart';
import 'package:flutter_application_1/ui/widgets/account_setup_card.dart';
import 'package:flutter_application_1/ui/widgets/appointment_card.dart';
import 'package:flutter_application_1/ui/widgets/invitation_card.dart';
import 'package:flutter_application_1/ui/widgets/more_button.dart';
import 'package:flutter_application_1/ui/widgets/stat_chip_buttons.dart';
import 'package:flutter_application_1/ui/widgets/stats_card.dart';
import 'package:flutter_application_1/ui/widgets/title_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final space = gap + 4.h;

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
          height: 35.h,
          width: 80.w,
          fit: BoxFit.cover,
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
              SizedBox(height: 32.h),
              const _AppointmentSection(),
              SizedBox(height: 33.h),
              const _MyStatsSection(),
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
    final size = MediaQuery.of(context).size;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: verticalSpace, left: horizontalSpace),
          child: const TitleText('You have 2 invitations'),
        ),
        SizedBox(height: gap / 2),
        SizedBox(
          height: size.width < 350 ? size.height * 0.12 : size.height * 0.15,
          child: ListView.separated(
            itemCount: 2,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: horizontalSpace),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return const InvitationCard();
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 12.w);
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
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.5.h),
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
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 15.sp,
                          ),
                    ),
                    SizedBox(height: 6.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'N',
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                letterSpacing: 1.2,
                                fontSize: 17.sp,
                              ),
                        ),
                        Text(
                          '25,000',
                          style: Theme.of(context).textTheme.headline5!.copyWith(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                letterSpacing: 1.2,
                                fontSize: 25.sp,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Withdraw',
                    style: Theme.of(context).textTheme.button!.copyWith(
                          color: color,
                          fontSize: 15.sp,
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
    final size = MediaQuery.of(context).size;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalSpace),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TitleText('Appointments'),
              MoreButton(onTap: () {}),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          height: size.width < 350 ? size.height * 0.27 : size.height * 0.335,
          child: ListView.separated(
            itemCount: 3,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: horizontalSpace),
            itemBuilder: (context, index) {
              return AppointmentCard(index);
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 20.w);
            },
          ),
        ),
      ],
    );
  }
}

class _MyStatsSection extends StatelessWidget {
  const _MyStatsSection({Key? key}) : super(key: key);

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
        const StatChipButtons(),
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
            padding: EdgeInsets.all(15.sp),
            decoration: const BoxDecoration(
              color: Color(0xff000793),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              AppIcons.videoCamera,
              height: 25.h,
              width: 25.w,
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Attend Webiner',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 15.sp,
                        color: const Color(0xff061725),
                      ),
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w300,
                        fontSize: 11.sp,
                        color: const Color(0xff061725),
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
          SizedBox(
            width: 262.w,
            child: Text(
              'Upgrade plan and Get More Invite to Match',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                    //fontSize: 15.sp,
                  ),
            ),
          ),
          SizedBox(height: gap / 4),
          SizedBox(
            width: 218.w,
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit dolor sit amet, dolor sit amet, consect nsect. ',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w300,
                    fontSize: 11.sp,
                  ),
            ),
          ),
          SizedBox(height: gap / 4),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: const Color(0xff1C71B7),
              fixedSize: Size(159.w, 39.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              'Upgrade',
              style: Theme.of(context).textTheme.button!.copyWith(
                    color: Colors.white,
                    fontSize: 15.sp,
                  ),
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
          padding: EdgeInsets.only(left: horizontalSpace, right: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TitleText('Resource centre'),
              MoreButton(onTap: () {}),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          height: 176.h,
          child: ListView.separated(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: horizontalSpace),
            itemBuilder: (context, index) {
              return Image.asset(
                AppImages.articleImage,
                height: 176.h,
                //width: 156.w,
                fit: BoxFit.contain,
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 16.w);
            },
          ),
        ),
      ],
    );
  }
}
