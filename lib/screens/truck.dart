import 'package:flutter/material.dart';
import 'dart:async';
import 'package:trip_app/helpers/truck_db.dart';
import 'package:trip_app/models/truck_model.dart';
import 'package:trip_app/screens/truck_entry.dart';

class Truck extends StatefulWidget{
  @override
  _TruckState createState() => _TruckState();
}

class _TruckState extends State<Truck> {

  Future<List<TruckModel>> _truckList;

  @override
  void initState(){
    super.initState();
    _updateTruckList();
  }

  _updateTruckList(){
    setState((){
      _truckList = TruckHelper.instance.getTruckList();
    });
  }

  Widget _buildTruck(TruckModel truck) {
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
                    child: Text("Fleet Number: ${truck.fleetNum}", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("License Plate: ${truck.licensePlate}",style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
                          textAlign: TextAlign.center
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("State: ${truck.state}", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
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
        title: Text("Truck Information", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24)),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => TruckEntry(
                updateTruckList: _updateTruckList,
              ),
            ),
          );
        },
      ),
      body: FutureBuilder(
        future: _truckList,
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
              return _buildTruck(snapshot.data[index]);
            },
          );
        },
      ),
    );
  }
}