import 'package:flutter/material.dart';
import 'package:tik_tok_clone/views/widgets/video_player_item.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body: PageView.builder(
        itemCount: 3,
        controller: PageController(
          initialPage: 0,
          viewportFraction: 0.8,
           ),
           scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
        return Stack(
          children: [
            // VideoPlayerItem(videoUrl:),
            Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Expanded(
                  
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left:20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [
                            Text(
                              "username",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              color: Colors.white,
                              ),
                            ),
                            Text(
                              "Caption",
                              style: TextStyle(
                                fontSize: 15,
                              color: Colors.white,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.music_note,
                                  size: 15,
                                  color: Colors.white,

                                ),
                                Text(
                                  "Song name",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  margin: EdgeInsets.only(top: size.height/5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    
                                  )
                                )
                                
                              ],
                            )
                          ]
                        )
                      )
                    )
                  ]
                ),
                )
              ],

            )
          ]
        );
      }),
    );
  }
}