import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: AppBar(
          title: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text("Huaniban/Milky Way"),
          ),
          centerTitle: true,
        ),
      ),
      floatingActionButton:
      Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 120,
                width: 120,
                padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 30.0),
                child: new FloatingActionButton(
                    child: Icon(Icons.local_taxi_outlined, size: 60),
                    onPressed: () {
                      Navigator.pushNamed(context, '/truck');
                    }
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 120,
                width: 120,
                padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 30.0),
                child: new FloatingActionButton(
                  child: Icon(Icons.subway, size: 60),
                  onPressed: () {
                    Navigator.pushNamed(context, '/trailer');
                  },
                ),
              ),
            ),
          ]
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              icon: Icon(Icons.book, size: 85.0),
              label: FittedBox(
                fit: BoxFit.contain,
                child: Text("New Trip"),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/New_Trip');
              },
            ),
            TextButton.icon(
              icon: Icon(Icons.local_taxi_sharp, size: 85.0),
              label: FittedBox(
                fit: BoxFit.contain,
                child: Text("Current Trip"),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/current_trip');
              },
            ),
            TextButton.icon(
              icon: Icon(Icons.book,size: 85.0),
              label: FittedBox(
                fit: BoxFit.contain,
                child: Text("Trip Register"),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/trip_register');
              },
            ),
          ],
        ),
      ),
    );
  }
}