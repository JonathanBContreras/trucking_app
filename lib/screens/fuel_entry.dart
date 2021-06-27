import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trip_app/helpers/fuel_db.dart';
import 'package:trip_app/models/fuel_model.dart';

class FuelEntry extends StatefulWidget{

  final Function updateFuelList;
  final FuelModel fuel;
  FuelEntry({this.updateFuelList, this.fuel});

  @override
  _FuelEntryState createState() => _FuelEntryState();
}

class _FuelEntryState extends State<FuelEntry>{

  final _formKey = GlobalKey<FormState>();

  String _city = "";
  String _state = "";
  String _station = "";
  String _highway = "";
  String _mileMarker = "";
  String _odometer = "";
  String _dieselAmount = "";
  String _dieselPrice = "";
  String _def = "";
  String _startingFuel = "";
  String _endFuel = "";

  @override
  void initState(){
    super.initState();

    if (widget.fuel != null){
      _city = widget.fuel.city;
      _state = widget.fuel.state;
      _station = widget.fuel.station;
      _highway = widget.fuel.highway;
      _mileMarker = widget.fuel.mileMarker;
      _odometer = widget.fuel.odometer;
      _dieselAmount = widget.fuel.dieselAmount;
      _dieselPrice = widget.fuel.dieselPrice;
      _def = widget.fuel.def;
      _startingFuel = widget.fuel.startingFuel;
      _endFuel = widget.fuel.endFuel;
    }
  }

  delete(){
    FuelHelper.instance.deleteFuel(widget.fuel.id);
    widget.updateFuelList();
  }

  _submit(){
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      print("$_city, $_state, $_station, $_highway, $_mileMarker,"
          "$_odometer, $_dieselAmount, $_dieselPrice, $_def, $_startingFuel,"
          "$_endFuel");
    }
    if(_city != ""){
      FuelModel fuel = FuelModel(
          _city, _state, _station, _highway, _mileMarker,
        _odometer, _dieselAmount, _dieselPrice, _def, _startingFuel,
          _endFuel);
      if(widget.fuel == null){
        FuelHelper.instance.insertFuel(fuel);
      }
      widget.updateFuelList();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FUEL STOP", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24)),
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
                    inputFormatters: [FilteringTextInputFormatter.deny(RegExp("[0-9+]"))],
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'City',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter a City" : null,
                    onSaved: (input) => _city = input,
                    initialValue: _city,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.deny(RegExp("[0-9+]"))],
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'State',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter a State" : null,
                    onSaved: (input) => _state = input,
                    initialValue: _state,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.deny(RegExp("[0-9+]"))],
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'Station',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter a Station" : null,
                    onSaved: (input) => _station = input,
                    initialValue: _station,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'Highway',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter Highway" : null,
                    onSaved: (input) => _highway = input,
                    initialValue: _highway,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9+]"))],
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'Mile Marker',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter Mile Marker" : null,
                    onSaved: (input) => _mileMarker = input,
                    initialValue: _mileMarker,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9+]"))],
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'Odometer',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter Odometer" : null,
                    onSaved: (input) => _odometer = input,
                    initialValue: _odometer,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9+]"))],
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'Diesel Amount',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter Amount of Diesel" : null,
                    onSaved: (input) => _dieselAmount = input,
                    initialValue: _dieselAmount,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9+]"))],
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'Diesel Price',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter Diesel Price" : null,
                    onSaved: (input) => _dieselPrice = input,
                    initialValue: _dieselPrice,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'Def',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter Def" : null,
                    onSaved: (input) => _def = input,
                    initialValue: _def,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9+]"))],
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'Starting Fuel Amount',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter Starting Diesel Amount" : null,
                    onSaved: (input) => _startingFuel = input,
                    initialValue: _startingFuel,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9+]"))],
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'End Fuel',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter Final Fuel" : null,
                    onSaved: (input) => _endFuel = input,
                    initialValue: _endFuel,
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
                      "Add to Fuel Stop",
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