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

  int _id = 0;
  String _licensePlate = "";
  String _state = "";

  @override
  void initState(){
    super.initState();

    if (widget.truck != null){
      _id =widget.truck.id;
      _licensePlate = widget.truck.licensePlate;
      _state = widget.truck.state;
    }
  }

  delete(){
    TruckHelper.instance.deleteTruck(widget.truck.id);
    widget.updateTruckList();
  }

  _submit(){

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}