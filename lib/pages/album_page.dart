import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spotify_clone_ui/pages/music_detail_page.dart';
import 'package:spotify_clone_ui/songs/songs_json.dart';
import 'package:spotify_clone_ui/themes/colors.dart';

class AlbumPage extends StatefulWidget {
 final dynamic song;

  const AlbumPage({Key key, this.song}) : super(key: key);

  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: getBody(),
    );
  }

  Widget getBody()
  {
    var size = MediaQuery.of(context).size;
    List songsAlbum = widget.song['songs'];

    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: size.width,
                height: 220,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(widget.song['img']),
                    fit: BoxFit.cover
                    )
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.song['title'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
                        child: Text(
                          "Subscribe",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30,),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: List.generate(songs.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, PageTransition(
                                alignment: Alignment.bottomCenter,
                                child: MusicDetailPage(
                                  title: songs[index]['title'],
                                  color: songs[index]['color'],
                                  description: songs[index]['description'],
                                  img: songs[index]['img'],
                                  songUrl: songs[index]['song_url'],
                                ),
                                type: PageTransitionType.scale));
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 180,
                                height: 180,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(songs[index]['img']),
                                        fit: BoxFit.cover),
                                    color: primary,
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                songs[index]['title'],
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: size.width-210,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      songs[index]['song_count'],
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      songs[index]['date'],
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Column(
                children: List.generate(songsAlbum.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, PageTransition(
                            alignment: Alignment.bottomCenter,
                            child: MusicDetailPage(
                              title: widget.song['title'],
                              color: widget.song['color'],
                              description: widget.song['description'],
                              img: widget.song['img'],
                              songUrl: widget.song['song_url'],
                            ),
                            type: PageTransitionType.scale));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: (size.width-60)*0.77,
                            height: 50,
                              child: Text(
                                "${index+1} "+songsAlbum[index]['title'],
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              ),
                          ),
                          Container(
                            width: (size.width - 60) * 0.23,
                            height: 50,
                            child: Row(
                              children: [
                                Text(
                                  songsAlbum[index]['duration'],
                                  style: TextStyle(
                                      color: Colors.grey,
                                    fontSize: 14
                                  ),
                                ),
                                Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.withOpacity(0.8),
                                  ),
                                  child: Center(
                                    child: Icon(Icons.play_arrow,
                                    color: Colors.white,
                                    size: 16,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
              )
            ],
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
                    onPressed: (){
                  Navigator.pop(context);
                }),
                IconButton(
                    icon: Icon(
                      Feather.more_vertical,
                      color: Colors.white,),
                    onPressed: (){
                      Navigator.pop(context);
                    })
              ],
            ),
          )
        ],
      )
    );
  }
}
