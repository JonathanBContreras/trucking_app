import 'package:flutter/material.dart';
import 'dart:async';
import 'package:trip_app/helpers/arrival_db.dart';
import 'package:trip_app/models/arrival_model.dart';
import 'package:trip_app/screens/arrival_entry.dart';

class Arrival extends StatefulWidget{
  @override
  _ArrivalState createState() => _ArrivalState();
}

class _ArrivalState extends State<Arrival> {

  Future<List<ArrivalModel>> _arrivalList;

  @override
  void initState(){
    super.initState();
    _updateArrivalList();
  }

  _updateArrivalList(){
    setState((){
      _arrivalList = ArrivalHelper.instance.getArrivalList();
    });
  }

  Widget _buildArrival(ArrivalModel arrival) {
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
                        Text("Bol Number: ${arrival.bolNumber}", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
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
                        Text("Po Number: ${arrival.poNumber}",style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
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
                        Text("ldNumber: ${arrival.ldNumber}", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("CF Number: ${arrival.cfNumber}", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
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
                        Text("Start Odometer: ${arrival.odometer0}",style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
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
                        Text("End Odometer: ${arrival.odometer1}", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Miles Driven: ${arrival.milesDriven}", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
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
                        Text("Seal: ${arrival.seal}",style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
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
                        Text("Hours: ${arrival.hours}", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Weight: ${arrival.weight}", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
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
                        Text("PCS: ${arrival.pcs}",style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
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
                        Text("Pallet Length: ${arrival.palletLength}", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
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
                        Text("Max Payload: ${arrival.maxPayload}",style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
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
        title: Text("Arrival Information", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24)),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ArrivalEntry(
                updateArrivalList: _updateArrivalList,
              ),
            ),
          );
        },
      ),
      body: FutureBuilder(
        future: _arrivalList,
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
              return _buildArrival(snapshot.data[index]);
            },
          );
        },
      ),
    );
  }
}