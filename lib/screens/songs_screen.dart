import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:jaguar_music_player/screens/playing_now.dart';

class SongsScreen extends StatefulWidget {
  @override
  _SongsScreenState createState() => _SongsScreenState();
}

class _SongsScreenState extends State<SongsScreen> {
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();

  List<SongInfo> song = [];
  // List<ArtistInfo> artist = [];

  // void getArtist() async {
  //   List<ArtistInfo> artists =
  //       await audioQuery.getArtists(); // returns all artists available
  //
  //   setState(() {
  //     artist = artists;
  //   });
  // }

  void getSongs() async {
    List<SongInfo> songs = await audioQuery.getSongs();
    setState(() {
      song = songs;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSongs();
    // getArtist();
  }

  String getTimeString(int seconds) {
    String minutes =
        '${(seconds / 60000).floor() < 10 ? 0 : ''}${(seconds / 60000).floor()}';

    String secondString =
        '${(seconds / 1000).floor() % 60 < 10 ? 0 : ''}${(seconds / 1000).floor() % 60}';
    return '$minutes:$secondString'; // Returns a string with the format mm:ss
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: song.length,
        itemBuilder: (ctx, index) => Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(PlayingNow.routeName, arguments: {
                          'duration': song[index].duration,
                          'title': song[index].title,
                          'artist': song[index].artist != null
                              ? song[index].artist
                              : 'unknown',
                          'image': audioQuery.getArtwork(type: ResourceType.ARTIST, id: song[index].id)
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 5),
                        width: MediaQuery.of(context).size.width * (2 / 3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              song[index].title,
                              maxLines: 1,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(song[index].artist != null
                                ? song[index].artist
                                : 'unknown'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(getTimeString(int.parse(song[index].duration))),
                    SizedBox(
                      width: 40,
                    ),
                    GestureDetector(
                      child: Icon(Icons.more_vert),
                    )
                  ],
                ),
                Divider(),
              ],
            ));
  }
}
