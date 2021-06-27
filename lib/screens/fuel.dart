import 'package:flutter/material.dart';
import 'dart:async';
import 'package:trip_app/helpers/fuel_db.dart';
import 'package:trip_app/models/fuel_model.dart';
import 'package:trip_app/screens/fuel_entry.dart';

class Fuel extends StatefulWidget{
  @override
  _FuelState createState() => _FuelState();
}

class _FuelState extends State<Fuel> {

  Future<List<FuelModel>> _fuelList;

  @override
  void initState(){
    super.initState();
    _updateFuelList();
  }

  _updateFuelList(){
    setState((){
      _fuelList = FuelHelper.instance.getFuelList();
    });
  }

  Widget _buildFuel(FuelModel fuel) {
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
                    child: Text("City: ${fuel.city}", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("State: ${fuel.state}",style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
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
                        Text("Station: ${fuel.station}", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Highway: ${fuel.highway}", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Mile Marker: ${fuel.mileMarker}",style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
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
                        Text("Odometer: ${fuel.odometer}", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Diesel Amount: ${fuel.dieselAmount}", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
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
                        Text("Diesel Price: ${fuel.dieselPrice}",style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
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
                        Text("Def: ${fuel.def}", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Starting Fuel: ${fuel.startingFuel}", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
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
                        Text("End Fuel: ${fuel.endFuel}",style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
                            textAlign: TextAlign.center
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
        title: Text("Fuel Stops", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24)),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => FuelEntry(
                updateFuelList: _updateFuelList,
              ),
            ),
          );
        },
      ),
      body: FutureBuilder(
        future: _fuelList,
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
              return _buildFuel(snapshot.data[index]);
            },
          );
        },
      ),
    );
  }
}