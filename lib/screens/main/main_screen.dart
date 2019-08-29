import 'package:everyday/screens/main/calendar_screen.dart';
import 'package:everyday/screens/main/discover_screen.dart';
import 'package:everyday/screens/main/profile_screen.dart';
import 'package:everyday/screens/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:everyday/screens/main/home_screen.dart';

class MainScreen extends StatefulWidget{
  MainScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainState();


}

class _MainState extends State<MainScreen> with AutomaticKeepAliveClientMixin<MainScreen>{
  PageController _pageController;
  int _page = 0;
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: new PageView(
          physics: NeverScrollableScrollPhysics(),
            onPageChanged: onPageChanged,
            controller: _pageController,
            children: <Widget>[
              HomeScreen(),
              CalendarScreen(),
              DiscoverScreen(),
              ProfileScreen()
            ]
        ),
      floatingActionButton: new FloatingActionButton(
        child: Image.asset("assets/ic_add.png"),
        backgroundColor: Color(0xFF82A0FA),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomAppBar(height: 48, iconSize: 24, items: [
        AppBarItem("assets/ic_home.png", "assets/ic_home_selected.png"),
        AppBarItem("assets/ic_calendar.png", "assets/ic_calendar_selected.png"),
        AppBarItem("assets/ic_discover.png", "assets/ic_discover_selected.png"),
        AppBarItem("assets/ic_profile.png", "assets/ic_profile_selected.png")
      ], navigationTapped: (index) {
        navigationTapped(index);
      },),
    );
  }

  void navigationTapped(int index) {
    _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease
    );
  }

  void onPageChanged(int value) {
    setState(() {
      this._page = value;
    });
  }

}