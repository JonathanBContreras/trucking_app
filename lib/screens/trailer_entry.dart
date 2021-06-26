import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:trip_app/helpers/trailer_db.dart';
import 'package:trip_app/models/trailer_model.dart';

class TrailerEntry extends StatefulWidget{

  final Function updateTrailerList;
  final TrailerModel trailer;
  TrailerEntry({this.updateTrailerList, this.trailer});

  @override
  _TrailerEntryState createState() => _TrailerEntryState();
}

class _TrailerEntryState extends State<TrailerEntry>{

  final _formKey = GlobalKey<FormState>();

  String _trailerNum = "";
  String _licensePlate = "";
  String _state = "";

  @override
  void initState(){
    super.initState();

    if (widget.trailer != null){
      _trailerNum = widget.trailer.trailerNum;
      _licensePlate = widget.trailer.licensePlate;
      _state = widget.trailer.state;
    }
  }

  delete(){
    TrailerHelper.instance.deleteTrailer(widget.trailer.id);
    widget.updateTrailerList();
  }

  _submit(){
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      print("$_trailerNum, $_licensePlate, $_state");
    }
    if(_trailerNum != ""){
      TrailerModel trailer = TrailerModel(
          _trailerNum, _licensePlate, _state);
      if(widget.trailer == null){
        TrailerHelper.instance.insertTrailer(trailer);
      }
      widget.updateTrailerList();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TRAILER ENTRY", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24)),
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
                      labelText: 'Trailer Number',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter a Trailer Number" : null,
                    onSaved: (input) => _trailerNum = input,
                    initialValue: _trailerNum,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    maxLength: 8,
                    maxLines: null,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 24),
                    decoration: InputDecoration(
                      labelText: 'License Plate',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter a License Plate" : null,
                    onSaved: (input) => _licensePlate = input,
                    initialValue: _licensePlate,
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
                      labelText: 'License Plate State',
                    ),
                    validator: (input) => input.trim().isEmpty ? "Please Enter a State" : null,
                    onSaved: (input) => _state = input,
                    initialValue: _state,
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
                      "Add to Trailers",
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