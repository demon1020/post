import 'package:blog/screens/sppl_dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/home_bloc.dart';
import 'application_screen.dart';
import 'dashboard_screen.dart';
import 'home_screen.dart';
import 'settings_screen.dart';

class BottomNavPage extends StatefulWidget {
  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  late int _selectedIndex = 0;

  List<Widget> _pages = [
    HomeScreen(
      userProfile: UserProfile(
        fullName: 'Baburam Nabik',
        city: 'Mapusa',
        wardNumber: '12',
        profileInfo: '14th October 1988',
      ),
    ),
    Container(),
    ApplicationScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? user = await prefs.getBool("sppl");
    if (user == null || user == false) {
      _pages[1] = DashboardScreen();
    }
    if (user == true) {
      _pages[1] = SpplDashboardScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Bottom Navigation Demo'),
      // ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_present_sharp),
            label: 'Application',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
