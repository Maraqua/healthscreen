import 'package:covid_19_hackathon/Upload/upload.dart';
import 'package:flutter/material.dart';
import 'Screens/community_screen.dart';
import 'Screens/healthcare_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHome());
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Community healthcare connected'),
            bottom: TabBar(
              tabs: [
                GestureDetector(
                    onTap: () {
                      print("Healthcare clicked");
                    },
                    child: Tab(
                        icon: Icon(
                          Icons.business,
                        ),
                        text: "Healthcare")),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new CommunityViewScreen()));
                    },
                    child: Tab(icon: Icon(Icons.home), text: "Community")),
                GestureDetector(
                  onTap: () {
                    print("News clicked");
                  },
                  child: Tab(icon: Icon(Icons.check_circle), text: "News"),
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            //added this to help in scrolling and show the floating action bar
            HealthCareScreen(),
            CommunityViewScreen(),
            CommunityViewScreen(),
          ]),
        ),
      ),
      routes: {
        '/healthcare_screen': (context) => HealthCareScreen(),
        '/upload': (context) => Upload(),
        // '/community_screen': (context) => CommunityViewScreen(),
        //  '/news_screen.': (context) => CommunityViewScreen(),
      },
    );
  }
}
