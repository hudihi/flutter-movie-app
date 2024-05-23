import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


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
              leading:  Icon(MdiIcons.googleTranslate),
              title:  const Text('App Language'),
              onTap: (){
                Navigator.pushNamed(context, '/trendingmovies');
              },
            ),
            ListTile(
              leading: Icon(MdiIcons.playlistMusic),
              title: const Text('My Playlist'),
              onTap: (){
                Navigator.pushNamed(context, '');
              },
            ),
            ListTile(
              onTap: (){},
                leading: Icon(MdiIcons.history),
                title: const Text('Watch History'),
                ),
            ListTile(
              leading: Icon(MdiIcons.youtubeSubscription),
              title: const Text('Subscriptions'),
              ),
              ListTile(
                onTap: (){},
                leading: Icon(MdiIcons.clockTimeFour),
                title: const Text('Watch later'),
                ),
                ListTile(
                  onTap: (){},
                  leading: const Icon(Icons.settings),
                  title: const Text('Setting'),

                ),
                ListTile(
                  onTap: (){},
                  leading:const Icon(Icons.logout),
                  title: const Text('Logout'),
                ),
        ],
      ),
    );
  }
}