import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/assets/icons.dart';
import 'package:flutter_application_1/ui/screens/appointments/appointments_screen.dart';
import 'package:flutter_application_1/ui/screens/home/home_screen.dart';
import 'package:flutter_application_1/ui/screens/more/more_screen.dart';
import 'package:flutter_application_1/ui/screens/tips/tips_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    AppointmentsScreen(),
    TipsScreen(),
    MoreScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 30,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xff1C71B7),
        selectedLabelStyle: Theme.of(context).textTheme.titleSmall,
        unselectedLabelStyle: Theme.of(context).textTheme.titleSmall,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SvgPicture.asset(
                AppIcons.home,
                color: const Color(0xff09263D),
              ),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SvgPicture.asset(
                AppIcons.home,
                color: const Color(0xff1C71B7),
              ),
            ),
            label: 'My Vhjobs',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SvgPicture.asset(AppIcons.appointment),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SvgPicture.asset(
                AppIcons.appointment,
                color: const Color(0xff1C71B7),
              ),
            ),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SvgPicture.asset(AppIcons.tips),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SvgPicture.asset(
                AppIcons.tips,
                color: const Color(0xff1C71B7),
              ),
            ),
            label: 'Tips',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SvgPicture.asset(AppIcons.menu),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SvgPicture.asset(
                AppIcons.menu,
                color: const Color(0xff1C71B7),
              ),
            ),
            label: 'Menu',
          ),
        ],
      ),
    );
  }
}
