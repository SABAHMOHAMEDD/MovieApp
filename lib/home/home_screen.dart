import 'package:flutter/material.dart';

import '../browse/browse_tab.dart';
import '../search/search_tab.dart';
import '../watch_list/watch_list_tab.dart';
import 'home_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String RouteName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.black,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFFFFBB3B),
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            label: '',
            backgroundColor: Colors.black,
            icon: ImageIcon(
              AssetImage('assets/images/ic_home.png'),
              size: 35,
            ),
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: ImageIcon(
                AssetImage('assets/images/ic_search.png'),
                size: 35,
              ),
              label: ''),
          BottomNavigationBarItem(
            label: '',
            backgroundColor: Colors.black,
            icon: ImageIcon(
              AssetImage('assets/images/ic_browse.png'),
              size: 35,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            backgroundColor: Colors.black,
            icon: ImageIcon(
              AssetImage('assets/images/ic_watchlist.png'),
              size: 35,
            ),
          ),
        ],
      ),
      body: (tabs[selectedIndex]),
    );
  }

  List<Widget> tabs = [HomeTab(), SearchTab(), BrowseTab(), WatchListTab()];
}
