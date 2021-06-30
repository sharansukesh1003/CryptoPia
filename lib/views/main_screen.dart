import 'package:btc_tracker/views/homescreen.dart';
import 'package:btc_tracker/views/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:btc_tracker/constants/constant_colors.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => new _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 0;
  PageController _pageController;

  List<Widget> tabPages = [
    HomeScreen(),
    NewsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  ConstantColors constantColors = ConstantColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: constantColors.secondaryColor,
        elevation: 3,
        title: Text(
          "Cryptopia.",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.white,
              fontFamily: 'Poppins'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        unselectedItemColor: Colors.grey[700],
        fixedColor: Colors.white,
        currentIndex: _pageIndex,
        onTap: onTabTapped,
        backgroundColor: constantColors.secondaryColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bar_chart_rounded,
                size: 30,
              ),
              label: 'Price'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.article_outlined,
                size: 30,
              ),
              label: 'News'),
        ],
      ),
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }
}
