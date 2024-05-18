import 'package:flutter/material.dart';
import 'package:movie_browser/screens/topratedmovies.dart';
import 'package:movie_browser/screens/trendingmovies.dart';
import 'package:movie_browser/screens/upcomingmovies.dart';
import 'package:movie_browser/top_bar/pop_up_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0000CD),
          title: Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          leading: const PopOptionMenu(),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              color: Colors.white,
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Trending',
              ),
              Tab(
                text: 'Popular',
              ),
              Tab(
                text: 'Upcoming',
              ),
            ],
            indicatorColor: Color(0xFFEDEDF2),
            labelColor: Color.fromRGBO(255, 255, 255, 1),
            dividerColor: Color(0xFF0000CD),
            unselectedLabelColor: Colors.white54,
          ),
        ),
        body: const TabBarView(
          children: [
            TabOne(),
            TabTwo(),
            TabThree(),
          ],
        ),
        drawer: const DrawerWidget(),
      ),
    );
  }
}
