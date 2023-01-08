import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_db_practical/screen/statistics/statistics_screen.dart';
import 'package:movie_db_practical/screen/top_movies/top_movies_screen.dart';
import 'package:movie_db_practical/screen/trailer/trailer_screen.dart';

import 'home/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  @override
  void initState() {
    super.initState();
  }

  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    buildCurrentPage(int i) {
      switch (i) {
        case 0:
          return const HomeScreen();

        case 1:
          return const TopMoviesScreen();
        case 2:
          return const TrailersScreen();
        case 3:
          return const StatisticsScreen();
        default:
          return Container();
      }
    }

    return Scaffold(
      body: buildCurrentPage(currentIndex),
      bottomNavigationBar: CupertinoTabBar(
        height: 60,
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade800,
            width: .4,
          ),
        ),
        backgroundColor: Colors.transparent,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        inactiveColor: Colors.grey,
        activeColor: Theme.of(context).primaryColor,
        currentIndex: currentIndex,
        iconSize: 26.0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            activeIcon: Icon(
              Icons.home_filled,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events_outlined),
            activeIcon: Icon(
              Icons.emoji_events_outlined,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_creation_outlined),
            activeIcon: Icon(
              Icons.movie_creation_outlined,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stacked_line_chart_outlined),
            activeIcon: Icon(
              Icons.stacked_line_chart_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
