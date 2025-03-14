import 'package:flutter/material.dart';
import 'package:testpust/global_strings.dart';
import 'Subscription.dart';
import 'soundfile.dart';
import 'DitUdbytte.dart';
import 'Profil.dart';
import 'PlaySong.dart';
import 'FavoritPage.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher.dart';
import 'ListSoundFiles.dart';


class SovGodtSoundPage extends StatefulWidget {
  static String tag = 'SovGodtSoundPage';
  @override
  State<StatefulWidget> createState() {
    return SovGodtSoundPageState();
  }



}

class SovGodtSoundPageState extends State<SovGodtSoundPage>{
  int index = 0;
  FavoritPage favoritPage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Sov Godt'),
            actions: <Widget>[
              IconButton(
                icon: new Image.asset(heartFilledAppBarImage),
                  onPressed: () {
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context) => FavoritPage()
                    )
                    );
                  },
              ),
              IconButton(
                icon: Icon(Icons.home, size: 35, color: Color.fromRGBO(142, 210, 238, 1.0)),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) => ListSoundFiles()
                  )
                  );
                },
              )
            ],
            backgroundColor: Color.fromRGBO(48, 121, 169, 1.0 )
        ),
        body: new Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(backgroundImage),
                  fit: BoxFit.fill,
                )
            ) ,

            child: new Center(
              child: new Container(
                padding: EdgeInsets.all(5.0),
                color: Color.fromRGBO(241, 242, 245, 0.55),
                height: 400,
                width: 350,
                child: new Center(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      cardSovGodtSoundFile0(index),
                      cardSovGodtSoundFile1(index),
                      cardSovGodtSoundFile2(index),
                      cardSovGodtSoundFile3(index),
                      cardSovGodtSoundFile4(index),
                    ],
                ),
                ),
              ),

            )
        ),
        bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Color.fromRGBO(48, 121, 169, 1.0)
          ),
          child: new BottomNavigationBar(
            // Gets the index of the pressed item. Switch case is used for redirecting to
            // the different pages
            //currentIndex: _currentIndex,
            onTap: (int index) {
              switch(index){
                case 0:
                //Redirects to Facebook
                  launchURL(facebookURL);
                  break;
                case 1:
                //Redirects to Instagram
                  launchURL(instagramURL);
                  break;
                case 2:
                // Redirects to Dit Udbytte / Formål
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DitUdbytte()));
                  break;
                case 3:
                // Redirects to Subscription
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Subscription()));
                  break;
                case 4:
                // Redirects to Erfaringsgrundlag
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Erfaringsgrundlag()));
                  break;
              }
            },
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem> [
              new BottomNavigationBarItem(
                //Icon for FB
                icon: new Image.asset(facebookImage,
                  height: 40,
                  width: 60,),
                label: '',
              ),
              new BottomNavigationBarItem(
                //Icon for Instagram
                  icon: new Image.asset(instagramImage,
                    height: 40,
                    width: 60,),
                  label: ''
              ),
              new BottomNavigationBarItem(
                //Icon for Formaal page
                icon: new Image.asset(formaalImage,
                  height: 40,
                  width: 60,),
                label: '',
              ),
              new BottomNavigationBarItem(
                //Icon for Subscription page
                icon: new Image.asset(betalingImage,
                  height: 40,
                  width: 60,),
                label: '',
              ),
              new BottomNavigationBarItem(
                //Icon for Erfaringsgrundlag page
                icon: new Image.asset(erfaringsgrundlagImage,
                  height: 40,
                  width: 60,),
                label: '',
              ),
            ],
          ),
        )
    );
  }

  Widget cardSovGodtSoundFile0(int index) {
    return new Card(
        color: Color.fromRGBO(241, 242, 245, 0.9),
            child: new Container(
              child: ListTile(
                title: Text(sovGodtSoundFiles[0].title, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(sovGodtSoundFiles[0].imagepath),

                ),
                subtitle: Text(sovGodtSoundFiles[0].description, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
                trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PlaySong(
                                  soundFile: sovGodtSoundFiles[0]),
                        )
                    );
                  },
          ),
        ),
    );
  }

  Widget cardSovGodtSoundFile1(int index) {
    return new Card(
        color: Color.fromRGBO(241, 242, 245, 0.9),
        child: new Container(
          child: ListTile(

            title: Text(sovGodtSoundFiles[1].title, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            leading: CircleAvatar(
              backgroundImage: AssetImage(sovGodtSoundFiles[1].imagepath),

            ),
            subtitle: Text(sovGodtSoundFiles[1].description, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PlaySong(
                            soundFile: sovGodtSoundFiles[1]),
                  )
              );
            },
          ),
        )
    );
  }

  Widget cardSovGodtSoundFile2(int index) {
    return new Card(
        color: Color.fromRGBO(241, 242, 245, 0.9),
        child: new Container(
          child: ListTile(

            title: Text(sovGodtSoundFiles[2].title, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            leading: CircleAvatar(
              backgroundImage: AssetImage(sovGodtSoundFiles[2].imagepath),

            ),
            subtitle: Text(sovGodtSoundFiles[2].description, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PlaySong(
                            soundFile: sovGodtSoundFiles[2]),
                  )
              );
            },
          ),
        )
    );
  }

  Widget cardSovGodtSoundFile3(int index) {
    return new Card(
        color: Color.fromRGBO(241, 242, 245, 0.9),
        child: new Container(
          child: ListTile(

            title: Text(sovGodtSoundFiles[3].title, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            leading: CircleAvatar(
              backgroundImage: AssetImage(sovGodtSoundFiles[3].imagepath),

            ),
            subtitle: Text(sovGodtSoundFiles[3].description, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PlaySong(
                            soundFile: sovGodtSoundFiles[3]),
                  )
              );
            },
          ),
        )
    );
  }

  Widget cardSovGodtSoundFile4(int index) {
    return new Card(
        color: Color.fromRGBO(241, 242, 245, 0.9),
        child: new Container(
          child: ListTile(

            title: Text(sovGodtSoundFiles[4].title, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            leading: CircleAvatar(
              backgroundImage: AssetImage(sovGodtSoundFiles[4].imagepath),

            ),
            subtitle: Text(sovGodtSoundFiles[4].description, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PlaySong(
                            soundFile: sovGodtSoundFiles[4]),
                  )
              );
            },
          ),
        )
    );
  }

  launchURL(String string) async {
    String url = string;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

List<SoundFile> sovGodtSoundFiles = [
  SoundFile('music/Sovgodt1.mp3', 'assets/images/SovGodt.png', "En naturlig søvn",
      "En liggende afspændingsøvelse 22:17 min"),
  SoundFile("music/Sovgodt2.mp3", "assets/images/SovGodt.png",
      "Find ro til din søvn", "En liggende afspændingsøvelse 19:23 min"),
  SoundFile("music/Sovgodt3.mp3", "assets/images/SovGodt.png",
      "Den gode søvn", "En liggende afspændingsøvelse 22:17 min"),
  SoundFile("music/Sovgodt4.mp3", "assets/images/SovGodt.png", "Find ro i dine tanker",
      "En liggende afspændingsøvelse 29:53 min"),
  SoundFile(
      "music/Sovgodt5.mp3", "assets/images/SovGodt.png", "Slip dagen i dag",
      "En liggende drømmerejse 20:25 min"),
];


