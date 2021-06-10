import 'package:flutter/material.dart';
import 'package:jaguar_music_player/screens/songs_screen.dart';
import 'package:jaguar_music_player/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {


  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: SafeArea(
        child: Scaffold(
            drawer: MainDrawer(),
            body: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    actions: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.sort)),
                      IconButton(onPressed: (){}, icon: Icon(Icons.search))
                    ],
                    leadingWidth: 30,
                    title: Text('My Music'),

                    pinned: true,
                    floating: true,
                    bottom: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: 0,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(50), // Creates border
                          color: Colors.greenAccent

                      ),
                      isScrollable: true,
                      tabs: [
                        Tab(child: Text('Tracks')),
                        Tab(child: Text('PlayLists')),
                        Tab(child: Text('Discover')),
                        Tab(child: Text('Folders')),
                        Tab(child: Text('Albums')),
                        Tab(child: Text('Artists')),
                        Tab(child: Text('Genres')),
                      ],
                    ),
                  ),
                ];
              },

              body: TabBarView(
                children: <Widget>[
                  SongsScreen(),
                  Icon(Icons.directions_transit, size: 350),
                  Icon(Icons.directions_car, size: 350),
                  Icon(Icons.directions_bike, size: 350),
                  Icon(Icons.directions_boat, size: 350),
                  Icon(Icons.directions_bike, size: 350),
                  Icon(Icons.directions_boat, size: 350),
                ],
              ),
            )),
      ),
    );
  }
}
