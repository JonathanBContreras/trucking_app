import 'package:flutter/material.dart';

class CurrentTrip extends StatefulWidget {
  @override
  _CurrentTripState createState() => _CurrentTripState();
}

class _CurrentTripState extends State<CurrentTrip> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: AppBar(
          title: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text("Trip Information"),
          ),
          centerTitle: true,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
      Stack(
        children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            height: 150,
            width: 150,
            padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 30.0),
            child: new FloatingActionButton(
              child: Icon(Icons.local_gas_station, size: 75),
              onPressed: () {
                Navigator.pushNamed(context, '/fuel');
                }
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
                child: Text("Trailer Weight"),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/weight');
              },
            ),
            TextButton.icon(
              icon: Icon(Icons.local_taxi_sharp, size: 85.0),
              label: FittedBox(
                fit: BoxFit.contain,
                child: Text("Destination"),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/destination');
              },
            ),
            TextButton.icon(
              icon: Icon(Icons.book,size: 85.0),
              label: FittedBox(
                fit: BoxFit.contain,
                child: Text("Pick Up Location"),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/pick_up_location');
              },
            ),
            TextButton.icon(
              icon: Icon(Icons.book,size: 85.0),
              label: FittedBox(
                fit: BoxFit.contain,
                child: Text("Arrival"),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/arrival');
              },
            ),
          ],
        ),
      ),
    );
  }
}