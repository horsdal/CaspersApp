import 'package:flutter/material.dart';
import 'package:testpust/FavoritPage.dart';
import 'package:testpust/Profil.dart';
import 'package:testpust/global_strings.dart';
import 'ListSoundFiles.dart';
import 'Subscription.dart';
import 'package:url_launcher/url_launcher.dart';


class DitUdbytte extends StatefulWidget {
  static String tag = 'Formål';
  @override
  State<StatefulWidget> createState() {
    return DitUdbytteState();
  }
}

class DitUdbytteState extends State<DitUdbytte> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formål"),
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
            //icon: new Image.asset(heartFilledAppBarImage,),
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
      ),
          child: new Center(
            child: new Container(
              padding: EdgeInsets.all(20.0),
              color: Color.fromRGBO(241, 242, 245, 0.55),
              height: 425,
              width: 350,
              child: new Center(
                  child: SingleChildScrollView(
                    child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //SizedBox(height: 55),
                      Container(
                        padding: EdgeInsets.all(15),
                        color: Color.fromRGBO(241, 242, 245, 0.9),
                        child: RichText(
                          text: TextSpan(
                            text: "Dit Pusterum" , style: TextStyle(color: Color.fromRGBO(46, 91, 140, 1), fontSize: 20),
                            children: <TextSpan>[
                              TextSpan(text: ditUdbytteText, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1), fontSize: 14))
                          ]
                        ),
                        ),
                      ),
                    ],
                    ),
                  ),
              ),
            ),
          ),
      ),


        bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(48, 121, 169, 1.0)
        ),
          child: new BottomNavigationBar(
            // Gets the index of the pressed item. Switch case is used for redirecting to
             // the different pages
            currentIndex: _currentIndex,
            onTap: (int index) {
            switch(index){
            case 0:
            launchURL(facebookURL);
            break;
            case 1:
            launchURL(instagramURL);
            break;
            case 2:
            // Redirects to Dit Udbytte / Formål
            //Navigator.push(context, MaterialPageRoute(builder: (context) => DitUdbytte()));
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
            title: Text(''),
          ),
          new BottomNavigationBarItem(
            //Icon for Instagram
              icon: new Image.asset(instagramImage,
                height: 40,
                width: 60,),
              title: new Text('')
          ),
          new BottomNavigationBarItem(
            //Icon for Formaal page
            icon: new Image.asset(formaalImage,
              height: 40,
              width: 60,),
            title: new Text(''),
          ),
          new BottomNavigationBarItem(
            //Icon for Subscription page
            icon: new Image.asset(betalingImage,
              height: 40,
              width: 60,),
            title: new Text(''),
          ),
          new BottomNavigationBarItem(
            //Icon for Erfaringsgrundlag page
            icon: new Image.asset(erfaringsgrundlagImage,
              height: 40,
              width: 60,),
            title: new Text(''),
          ),
        ],
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
