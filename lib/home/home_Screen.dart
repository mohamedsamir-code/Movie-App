import 'package:flutter/material.dart';
import 'package:movie_app/MyTheme.dart';
import 'package:movie_app/category/category_screen.dart';
import 'package:movie_app/home/home_screen_body.dart';
import 'package:movie_app/search/search_screen.dart';
import 'package:movie_app/watchlist/watchlist_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  var pageList = [HomeScreenBody(),SearchScreen(),CategoryScreen(),WatchlistScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.blackColor,
      bottomNavigationBar: Theme(
        data: ThemeData(canvasColor: Color(0xFF1A1A1A)),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          elevation: 0,
          selectedItemColor: MyTheme.yellowColor,
          unselectedItemColor: MyTheme.silverColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.movie), label: 'Browse'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmarks_outlined), label: 'Watchlist'),
          ],
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
        ),
      ),
      body: pageList[selectedIndex],
    );
  }
}
