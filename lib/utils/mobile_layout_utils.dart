import 'package:farmgo/configs/custom_colors.dart';
import 'package:farmgo/configs/defined_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/camera_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/shop_screen.dart';
import '../screens/weather_screen.dart';


class MobileLayoutUtils extends StatefulWidget {
  const MobileLayoutUtils({super.key});

  @override
  State<MobileLayoutUtils> createState() => _MobileLayoutUtilsState();
}

class _MobileLayoutUtilsState extends State<MobileLayoutUtils> {

  int _page = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  onPageChanged(int page){
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: const [
          HomeScreen(),
          ShopScreen(),
          CameraScreen(),
          WeatherScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        height: 50,
        backgroundColor: fieldContrastDark,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: _page == 0? greenColorSecondary : textColorGrey),
            label: "",
            backgroundColor: customPrimaryColorLight,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: _page == 1? greenColorSecondary : textColorGrey),
            label: "",
            backgroundColor: customPrimaryColorLight,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt, color: _page == 2? greenColorSecondary : textColorGrey),
            label: "",
            backgroundColor: customPrimaryColorLight,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloudy_snowing, color: _page == 3? greenColorSecondary : textColorGrey),
            label: "",
            backgroundColor: customPrimaryColorLight,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: _page == 4? greenColorSecondary : textColorGrey),
            label: "",
            backgroundColor: customPrimaryColorLight,
          ),
        ],
        onTap: (page) {
          navigationTapped(page);
        },
      ),
    );
  }
}