import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:trip_app/helpers/weight_db.dart';
import 'package:trip_app/models/weight_model.dart';

class WeightEntry extends StatefulWidget{

  final Function updateWeightList;
  final WeightModel weight;
  WeightEntry({this.updateWeightList, this.weight});

  @override
  _WeightEntryState createState() => _WeightEntryState();
}

class _WeightEntryState extends State<WeightEntry>{

  final _formKey = GlobalKey<FormState>();

  String _tripNum = "";
  String _steers = "";
  String _drives = "";
  String _trailerTandoms = "";
  String _tractor = "";
  String _drvsAndTrtand = "";
  String _fuelWeight = "";
  String _grossWeight = "";

  @override
  void initState(){
    super.initState();

    if (widget.weight != null){
      _tripNum = widget.weight.tripNum;
      _steers = widget.weight.steers;
      _drives = widget.weight.drives;
      _trailerTandoms = widget.weight.trailerTandoms;
      _tractor = widget.weight.tractor;
      _drvsAndTrtand = widget.weight.drvsAndTrtand;
      _fuelWeight = widget.weight.fuelWeight;
      _grossWeight = widget.weight.grossWeight;
    }
  }

  delete(){
    WeightHelper.instance.deleteWeight(widget.weight.id);
    widget.updateWeightList();
  }

  _submit(){
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      print("$_tripNum, $_steers, $_drives, $_trailerTandoms, "
          "$_tractor, $_drvsAndTrtand, $_fuelWeight, $_grossWeight");
    }
    if(_tripNum != null){
      WeightModel weight = WeightModel(
          _tripNum, _steers, _drives, _trailerTandoms,
        _tractor, _drvsAndTrtand, _fuelWeight, _grossWeight);
      if(widget.weight == null){
        WeightHelper.instance.insertWeight(weight);
      }
      widget.updateWeightList();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WEIGHT ENTRY", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24)),
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
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9+]"))],
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'Trip Number',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter a Trip Number" : null,
                    onSaved: (input) => _tripNum = input,
                    initialValue: _tripNum,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9+]"))],
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'Steer Weight',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter Steer Weight" : null,
                    onSaved: (input) => _steers = input,
                    initialValue: _steers,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9+]"))],
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'Drives Weight',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter Drives Weight" : null,
                    onSaved: (input) => _drives = input,
                    initialValue: _drives,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9+]"))],
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'Trailer Tandoms Weight',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter Trailer Tandoms Weight" : null,
                    onSaved: (input) => _trailerTandoms = input,
                    initialValue: _trailerTandoms,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9+]"))],
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'Tractor Weight',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter Tractor Weight" : null,
                    onSaved: (input) => _tractor = input,
                    initialValue: _tractor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9+]"))],
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'Drives and Trtand Weight',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter Drives and Trtand Weight" : null,
                    onSaved: (input) => _drvsAndTrtand = input,
                    initialValue: _drvsAndTrtand,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9+]"))],
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'Fuel Weight',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter Fuel Weight" : null,
                    onSaved: (input) => _fuelWeight = input,
                    initialValue: _fuelWeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9+]"))],
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'Gross Weight',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter Gross Weight" : null,
                    onSaved: (input) => _grossWeight = input,
                    initialValue: _grossWeight,
                  ),
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
                      "Add to Weight",
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