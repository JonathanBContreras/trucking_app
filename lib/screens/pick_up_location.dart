import 'package:flutter/material.dart';
import 'dart:async';
import 'package:trip_app/helpers/pick_up_location_db.dart';
import 'package:trip_app/models/pick_up_location_model.dart';
import 'package:trip_app/screens/pick_up_location_entry.dart';

class PickupLocation extends StatefulWidget{
  @override
  _PickupLocationState createState() => _PickupLocationState();
}

class _PickupLocationState extends State<PickupLocation> {

  Future<List<PickupLocationModel>> _pickuplocationList;

  @override
  void initState(){
    super.initState();
    _updatePickupLocationList();
  }

  _updatePickupLocationList(){
    setState((){
      _pickuplocationList = PickupLocationHelper.instance.getPickupLocationList();
    });
  }

  Widget _buildPickupLocation(PickupLocationModel pickuplocation) {
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
                        Text("Address: ${pickuplocation.streetNameAndNumber}", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
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
                        Text("City: ${pickuplocation.city}",style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
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
                        Text("State: ${pickuplocation.state}", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Zipcode: ${pickuplocation.zipcode}", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
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
                        Text("Distributor: ${pickuplocation.distributor}",style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
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
                        Text("Date: ${pickuplocation.date}", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Time: ${pickuplocation.time.toString().substring(10,15)}", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
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
        title: Text("Pickup Location", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24)),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PickupLocationEntry(
                updatePickupLocationList: _updatePickupLocationList,
              ),
            ),
          );
        },
      ),
      body: FutureBuilder(
        future: _pickuplocationList,
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
              return _buildPickupLocation(snapshot.data[index]);
            },
          );
        },
      ),
    );
  }
}