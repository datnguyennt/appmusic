import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/app_colors.dart' as AppColors;
import 'package:musicapp/audio_file.dart';

class DetailAudioPage extends StatefulWidget {
  final booksData;
  final int index;
  const DetailAudioPage({Key? key, this.booksData, required this.index}) : super(key: key);

  @override
  _DetailAudioPageState createState() => _DetailAudioPageState();
}

class _DetailAudioPageState extends State<DetailAudioPage> {
  late AudioPlayer advancedPlayer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    advancedPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.audioGreyBackground,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight / 3,
            child: Container(
              color: AppColors.audioBlueBackground,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: IconButton(
                onPressed: () {
                  advancedPlayer.stop();
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: screenHeight * 0.2,
            height: screenHeight * 0.36,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: screenHeight * 0.1,
                  ),
                  Text(
                    this.widget.booksData[this.widget.index]['title'],
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    this.widget.booksData[this.widget.index]['text'],
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  AudioFile(advancedPlayer: advancedPlayer, audioPath: this.widget.booksData[this.widget.index]['audio'],),
                ],
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.12,
            left: (screenWidth - 150) / 2,
            right: (screenWidth - 150) / 2,
            child: Container(
              height: screenHeight * 0.16,
              width: 50.0,
              decoration: BoxDecoration(
                color: AppColors.audioGreyBackground,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.white, width: 2.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 5.0),
                      image: DecorationImage(
                        image: AssetImage(this.widget.booksData[this.widget.index]['img']),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
