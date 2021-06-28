import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trip_app/helpers/arrival_db.dart';
import 'package:trip_app/models/arrival_model.dart';

class ArrivalEntry extends StatefulWidget{

  final Function updateArrivalList;
  final ArrivalModel arrival;
  ArrivalEntry({this.updateArrivalList, this.arrival});

  @override
  _ArrivalEntryState createState() => _ArrivalEntryState();
}

class _ArrivalEntryState extends State<ArrivalEntry>{

  final _formKey = GlobalKey<FormState>();

  String _bolNumber = "";
  String _poNumber = "";
  String _ldNumber = "";
  String _cfNumber = "";
  String _odometer0 = "";
  String _odometer1 = "";
  String _milesDriven = "";
  String _seal = "";
  String _hours = "";
  String _weight = "";
  String _pcs = "";
  String _palletLength = "";
  String _maxPayload = "";

  @override
  void initState(){
    super.initState();

    if (widget.arrival != null){
      _bolNumber = widget.arrival.bolNumber;
      _poNumber = widget.arrival.poNumber;
      _ldNumber = widget.arrival.ldNumber;
      _cfNumber = widget.arrival.cfNumber;
      _odometer0 = widget.arrival.odometer0;
      _odometer1 = widget.arrival.odometer1;
      _milesDriven = widget.arrival.milesDriven;
      _seal = widget.arrival.seal;
      _hours = widget.arrival.hours;
      _weight = widget.arrival.weight;
      _pcs = widget.arrival.pcs;
      _palletLength = widget.arrival.palletLength;
      _maxPayload = widget.arrival.maxPayload;
    }
  }

  delete(){
    ArrivalHelper.instance.deleteArrival(widget.arrival.id);
    widget.updateArrivalList();
  }

  _submit(){
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      print("$_bolNumber, $_poNumber, $_ldNumber, $_cfNumber, $_odometer0,"
          "$_odometer1, $_milesDriven, $_seal, $_hours, $_weight,"
          "$_pcs, $_palletLength, $_maxPayload");
    }
    if(_bolNumber != ""){
      ArrivalModel arrival = ArrivalModel(
          _bolNumber, _poNumber, _ldNumber, _cfNumber, _odometer0,
          _odometer1, _milesDriven, _seal, _hours, _weight, _pcs,
          _palletLength, _maxPayload);
      if(widget.arrival == null){
        ArrivalHelper.instance.insertArrival(arrival);
      }
      widget.updateArrivalList();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ARRIVAL", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24)),
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
                      labelText: 'Bol Number',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter Bol Number" : null,
                    onSaved: (input) => _bolNumber = input,
                    initialValue: _bolNumber,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9+]"))],
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'Po Number',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter Po Number" : null,
                    onSaved: (input) => _poNumber = input,
                    initialValue: _poNumber,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9+]"))],
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'ld Number',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter ld Number" : null,
                    onSaved: (input) => _ldNumber = input,
                    initialValue: _ldNumber,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9+]"))],
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'cf Number',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter CF Number" : null,
                    onSaved: (input) => _cfNumber = input,
                    initialValue: _cfNumber,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9+]"))],
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'Odometer Start',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter Odometer Start" : null,
                    onSaved: (input) => _odometer0 = input,
                    initialValue: _odometer0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9+]"))],
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'Odometer End',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter Odometer End" : null,
                    onSaved: (input) => _odometer1 = input,
                    initialValue: _odometer1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9+]"))],
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'Miles Driven',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter Miles Driven" : null,
                    onSaved: (input) => _milesDriven = input,
                    initialValue: _milesDriven,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9+]"))],
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'Seal',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter Seal" : null,
                    onSaved: (input) => _seal = input,
                    initialValue: _seal,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9+]"))],
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'hours',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter Hours" : null,
                    onSaved: (input) => _hours = input,
                    initialValue: _hours,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'Weight',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter Weight" : null,
                    onSaved: (input) => _weight = input,
                    initialValue: _weight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9+]"))],
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'PCS',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter PCS" : null,
                    onSaved: (input) => _pcs = input,
                    initialValue: _pcs,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9+]"))],
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'Pallet Length',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter Pallet Length" : null,
                    onSaved: (input) => _palletLength = input,
                    initialValue: _palletLength,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9+]"))],
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'Max Payload',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter Max Payload" : null,
                    onSaved: (input) => _maxPayload = input,
                    initialValue: _maxPayload,
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
                      "Add to Arrival",
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