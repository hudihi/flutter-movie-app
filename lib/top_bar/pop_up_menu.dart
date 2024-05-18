import 'package:flutter/material.dart';

class PopOptionMenu extends StatelessWidget {
  const PopOptionMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.menu,
      color: Colors.white,),
      onPressed: (){
        Scaffold.of(context).openDrawer();
      },
      );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget> [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Menu'),
            ),
            ListTile(
              title:  const Text('Trending movies'),
              onTap: (){
                Navigator.pushNamed(context, '/trendingmovies');
              },
            ),
            ListTile(
              title: const Text('Top Rated Movies'),
              onTap: (){
                Navigator.pushNamed(context, '');
              },
            )
        ],
      ),
    );
  }
}