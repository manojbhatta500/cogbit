import 'dart:io';

import 'package:cogbit/pages/my_app_screen.dart';
import 'package:cogbit/pages/my_task_screen.dart';
import 'package:cogbit/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  DateTime? backButtonPressTime;

  final List<Widget> _buildScreens = [
    const MyAppScreen(),
    const MyTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex != 0) {
          setState(() {
            _selectedIndex = 0;
          });
          return false;
        } else {
          final backButtonHasNotBeenPressedOrSnackBarHasBeenClosed =
              backButtonPressTime == null;
          if (backButtonHasNotBeenPressedOrSnackBarHasBeenClosed) {
            backButtonPressTime = DateTime.now();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Press back again to exit'),
                duration: Duration(seconds: 2),
              ),
            );
            return false;
          }
          exit(0);
        }
      },
      child: Scaffold(
        extendBody: true,
        body: _buildScreens.elementAt(_selectedIndex),
        bottomNavigationBar: Container(
          height: Platform.isAndroid ? 60 : null,
          margin: Platform.isAndroid
              ? const EdgeInsets.only(
                  left: 20,
                  bottom: 20,
                  right: 20,
                )
              : null,
          decoration: ShapeDecoration(
            color: Colors
                .white, // Set to white or your preferred color for better visibility
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 2,
                offset: Offset(0, 2),
                spreadRadius: 0,
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BottomNavigationBar(
              backgroundColor: Colors
                  .white, // Set to white or your preferred color for better visibility
              elevation: 0.0,
              showSelectedLabels: true,
              unselectedItemColor: const Color(0xFFBFBFBF),
              showUnselectedLabels: true,
              selectedItemColor: const Color(0xFF2897F1),
              currentIndex: _selectedIndex,
              onTap: (currentIndex) {
                setState(() {
                  _selectedIndex = currentIndex;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: _selectedIndex == 0
                        ? CustomColors.purpleColor
                        : CustomColors.greenColor,
                  ),
                  label: "My App",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.task,
                    color: _selectedIndex == 1
                        ? CustomColors.purpleColor
                        : CustomColors.greenColor,
                  ),
                  label: "My Tasks",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
