import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trip_app/helpers/destination_db.dart';
import 'package:trip_app/models/destination_model.dart';

class DestinationEntry extends StatefulWidget{

  final Function updateDestinationList;
  final DestinationModel destination;
  DestinationEntry({this.updateDestinationList, this.destination});

  @override
  _DestinationEntryState createState() => _DestinationEntryState();
}

class _DestinationEntryState extends State<DestinationEntry>{

  final _formKey = GlobalKey<FormState>();

  String _streetNameAndNumber = "";
  String _city = "";
  String _state = "";
  String _zipcode = "";
  String _distributor = "";
  String _date = "";
  TimeOfDay _time = TimeOfDay.now();

  Future<Null> selectTime(BuildContext context) async {
    _time = await showTimePicker(
      context: context,
      initialTime: _time,
    );
  }

  @override
  void initState(){
    super.initState();

    if (widget.destination != null){
      _streetNameAndNumber = widget.destination.streetNameAndNumber;
      _city = widget.destination.city;
      _state = widget.destination.state;
      _zipcode = widget.destination.zipcode;
      _distributor = widget.destination.distributor;
      _date = widget.destination.distributor;
      _time = widget.destination.time as TimeOfDay;
    }
  }

  delete(){
    DestinationHelper.instance.deleteDestination(widget.destination.id);
    widget.updateDestinationList();
  }

  _submit(){
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      print("$_streetNameAndNumber, $_city, $_state, $_zipcode, $_distributor,"
          "$_time");
    }
    if(_streetNameAndNumber != ""){
      DestinationModel destination = DestinationModel(
          _streetNameAndNumber, _city, _state, _zipcode, _distributor, _date, _time.toString());
      if(widget.destination == null){
        DestinationHelper.instance.insertDestination(destination);
      }
      widget.updateDestinationList();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Destination", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24)),
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
                      labelText: 'Street Name and Number',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter an Address" : null,
                    onSaved: (input) => _streetNameAndNumber = input,
                    initialValue: _streetNameAndNumber,
                  ),
                ),
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
                    maxLength: 2,
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
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'Zipcode',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter Zipcode" : null,
                    onSaved: (input) => _zipcode = input,
                    initialValue: _zipcode,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'Distributor',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter Distributor" : null,
                    onSaved: (input) => _distributor = input,
                    initialValue: _distributor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'Date MM/DD/YYYY',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter Date" : null,
                    onSaved: (input) => _date = input,
                    initialValue: _date,
                  ),
                ),
                IconButton(
                    iconSize: MediaQuery.of(context).size.height / 24,
                    icon: Icon(Icons.alarm_add, size: MediaQuery.of(context).size.height / 20),
                    onPressed: () {
                      selectTime(context);
                    }
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
                      "Add Destination",
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