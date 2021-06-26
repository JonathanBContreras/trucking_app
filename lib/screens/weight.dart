import 'package:flutter/material.dart';
import 'dart:async';
import 'package:trip_app/helpers/weight_db.dart';
import 'package:trip_app/models/weight_model.dart';
import 'package:trip_app/screens/weight_entry.dart';

class Weight extends StatefulWidget{
  @override
  _WeightState createState() => _WeightState();
}

class _WeightState extends State<Weight> {

  Future<List<WeightModel>> _weightList;

  @override
  void initState(){
    super.initState();
    _updateWeightList();
  }

  _updateWeightList(){
    setState((){
      _weightList = WeightHelper.instance.getWeightList();
    });
  }

  Widget _buildWeight(WeightModel weight) {
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
                    child: Text("Trip Num: ${weight.tripNum}", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Steers Weight: ${weight.steers}",style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
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
                        Text("Drives weight: ${weight.drives}",style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
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
                        Text("Trailer Tandoms: ${weight.trailerTandoms}", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tractor Weight: ${weight.tractor}",style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
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
                        Text("Drvs And Trtand weight: ${weight.drvsAndTrtand}",style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
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
                        Text("Fuel Weight: ${weight.fuelWeight}", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Gross Weight: ${weight.grossWeight}", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 36),
                            textAlign: TextAlign.center),
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
        title: Text("Weight Information", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24)),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => WeightEntry(
                updateWeightList: _updateWeightList,
              ),
            ),
          );
        },
      ),
      body: FutureBuilder(
        future: _weightList,
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
              return _buildWeight(snapshot.data[index]);
            },
          );
        },
      ),
    );
  }
}