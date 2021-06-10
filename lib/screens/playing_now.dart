import 'package:flutter/material.dart';

class PlayingNow extends StatefulWidget {
  static const routeName='/playing_now';

  @override
  _PlayingNowState createState() => _PlayingNowState();
}

class _PlayingNowState extends State<PlayingNow> {
  String getTimeString(int seconds) {
    String minutes=
        '${(seconds/60000).floor()<10?0:''}${(seconds/60000).floor()}';

    String secondString =
        '${(seconds/1000).floor()%60<10?0:''}${(seconds/1000).floor()%60}';
    return '$minutes:$secondString'; // Returns a string with the format mm:ss
  }

  @override
  Widget build(BuildContext context) {
    final songInfo=ModalRoute.of(context)!.settings.arguments as Map<String , dynamic>;
    String duration=songInfo['duration'];
    String title=songInfo['title'];
    String artist=songInfo['artist'];
    final info=songInfo['image'];
    print(info);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        actions: [
          IconButton(onPressed: (){}, icon:Icon(Icons.queue_music,size: 35,) ),
          IconButton(onPressed: (){}, icon:Icon(Icons.bar_chart,size: 35,) ),
          IconButton(onPressed: (){}, icon:Icon(Icons.more_vert,size: 35,) )
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,

           child: CircleAvatar(
             backgroundImage: AssetImage('assets/images/pngegg.png'),
              child: CircleAvatar(
                foregroundColor: Colors.black54,
              ),
           ),
            height: MediaQuery.of(context).size.height*3/5,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color:  Colors.black54 ,width: 1 ),
              borderRadius: BorderRadius.all(Radius.circular(15))

            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: (){}, icon:Icon(Icons.camera_alt,size: 35,) ),
                IconButton(onPressed: (){}, icon:Icon(Icons.favorite_border,size: 35,) ),
                IconButton(onPressed: (){}, icon:Icon(Icons.volume_up,size: 35,) )
              ],
            ),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){}, icon:Icon(Icons.shuffle,size: 35,) ),
              IconButton(onPressed: (){}, icon:Icon(Icons.skip_previous,size: 35,) ),
              IconButton(onPressed: (){}, icon:Icon(Icons.play_arrow,size: 35,) ),
              IconButton(onPressed: (){}, icon:Icon(Icons.skip_next,size: 35,) ),
              IconButton(onPressed: (){}, icon:Icon(Icons.repeat,size: 35,) )
            ],

          ),
          SizedBox(height: 25,),
          Row(
            children: [
              Text('0:00'),
              Expanded(
                child: Container(
                  width: 240,
                  height: 2,
                  child: Slider.adaptive(
                    value: (0 / 1000).floorToDouble(),
                    onChanged: (value) {
                      // seekTo(value.toInt());
                    },
                    max: (10000 / 1000).floorToDouble(),
                  ),
                ),
              ),
              Text(getTimeString(int.parse(duration))),

            ],
          ),
          SizedBox(height: 25,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Text(title,style: TextStyle(
                  fontSize: 25
                ),),
              ],
            ),
          ),
          SizedBox(height: 15,),
          Text(artist)
        ],
      ),

    );
  }
}
