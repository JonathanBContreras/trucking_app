import 'package:flutter/material.dart';
import 'dart:async';
import 'package:trip_app/helpers/destination_db.dart';
import 'package:trip_app/models/destination_model.dart';
import 'package:trip_app/screens/destination_entry.dart';

class Destination extends StatefulWidget{
  @override
  _DestinationState createState() => _DestinationState();
}

class _DestinationState extends State<Destination> {

  Future<List<DestinationModel>> _destinationList;

  @override
  void initState(){
    super.initState();
    _updateDestinationList();
  }

  _updateDestinationList(){
    setState((){
      _destinationList = DestinationHelper.instance.getDestinationList();
    });
  }

  Widget _buildDestination(DestinationModel destination) {
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Address: ${destination.streetNameAndNumber}", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("City: ${destination.city}",style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
                            textAlign: TextAlign.center
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("State: ${destination.state}", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Zipcode: ${destination.zipcode}", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Distributor: ${destination.distributor}",style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
                            textAlign: TextAlign.center
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Date: ${destination.date}", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Time: ${destination.time.toString().substring(10,15)}", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
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
        title: Text("Destination", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24)),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DestinationEntry(
                updateDestinationList: _updateDestinationList,
              ),
            ),
          );
        },
      ),
      body: FutureBuilder(
        future: _destinationList,
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
              return _buildDestination(snapshot.data[index]);
            },
          );
        },
      ),
    );
  }
}