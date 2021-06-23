import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:trip_app/helpers/current_trip_db.dart';
import 'package:trip_app/models/current_trip_model.dart';

class TruckEntry extends StatefulWidget{

  final Function updateTruckList;
  final TruckModel truck;
  TruckEntry({this.updateTruckList, this.truck});

  @override
  _TruckEntryState createState() => _TruckEntryState();
}

class _TruckEntryState extends State<TruckEntry>{

  final _formKey = GlobalKey<FormState>();
  final values = List.filled(7, false);

  String _fleetNum = "";
  String _licensePlate = "";
  String _state = "";

  @override
  void initState(){
    super.initState();

    if (widget.truck != null){
      _fleetNum = widget.truck.fleetNum;
      _licensePlate = widget.truck.licensePlate;
      _state = widget.truck.state;
    }
  }

  delete(){
    TruckHelper.instance.deleteTruck(widget.truck.id);
    widget.updateTruckList();
  }

  _submit(){
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      print("$_fleetNum, $_licensePlate, $_state");
    }
    if(_fleetNum != ""){
      TruckModel truck = TruckModel(
      _fleetNum, _licensePlate, _state);
      if(widget.truck == null){
        TruckHelper.instance.insertTruck(truck);
      }
      widget.updateTruckList();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TRUCK ENTRY", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24)),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'Truck Fleet Number',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter a FleetNumber" : null,
                    onSaved: (input) => _fleetNum = input,
                    initialValue: _fleetNum,
                  ),
                ),
                TextFormField(
                  maxLines: null,
                  style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                  decoration: InputDecoration(
                    labelText: 'Truck License Plate',
                  ),
                  validator: (input) => input.trim().isEmpty ? "Please Enter a License Plate" : null,
                  onSaved: (input) => _licensePlate = input,
                  initialValue: _licensePlate,
                ),
                TextFormField(
                  maxLines: null,
                  style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                  decoration: InputDecoration(
                    labelText: 'Truck License Plate State',
                  ),
                  validator: (input) => input.trim().isEmpty ? "Please Enter a State" : null,
                  onSaved: (input) => _state = input,
                  initialValue: _state,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 25.0),
                  height: MediaQuery.of(context).size.height / 16,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.blue
                  ),
                  child: TextButton(
                    onPressed: _submit,
                    child: Text(
                      "Add to Trucks",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height / 32,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}