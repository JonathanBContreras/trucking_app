import 'package:flutter/material.dart';
import 'dart:async';
import 'package:trip_app/helpers/trailer_db.dart';
import 'package:trip_app/models/trailer_model.dart';
import 'package:trip_app/screens/trailer_entry.dart';

class Trailer extends StatefulWidget{
  @override
  _TrailerState createState() => _TrailerState();
}

class _TrailerState extends State<Trailer> {

  Future<List<TrailerModel>> _trailerList;

  @override
  void initState(){
    super.initState();
    _updateTrailerList();
  }

  _updateTrailerList(){
    setState((){
      _trailerList = TrailerHelper.instance.getTrailerList();
    });
  }

  Widget _buildTrailer(TrailerModel trailer) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue[200],
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Trailer Number: ${trailer.trailerNum}", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("License Plate: ${trailer.licensePlate}",style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
                          textAlign: TextAlign.center
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("State: ${trailer.state}", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
                          textAlign: TextAlign.center),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 36)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trailer Information", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24)),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => TrailerEntry(
                updateTrailerList: _updateTrailerList,
              ),
            ),
          );
          },
      ),
      body: FutureBuilder(
        future: _trailerList,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text(
                "Tap Plus Button to Add an Entry",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: MediaQuery.of(context).size.height / 30,
                ),
              ),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 80.0),
            itemBuilder: (BuildContext context, int index) {
              return _buildTrailer(snapshot.data[index]);
            },
          );
        },
      ),
    );
  }
}