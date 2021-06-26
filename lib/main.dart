import 'package:flutter/material.dart';
import 'package:trip_app/screens/home.dart';
import 'package:trip_app/screens/truck.dart';
import 'package:trip_app/screens/trailer.dart';
import 'package:trip_app/screens/weight.dart';
import 'package:trip_app/screens/current_trip.dart';
import 'package:trip_app/screens/truck_entry.dart';
import 'package:trip_app/screens/trailer_entry.dart';
import 'package:trip_app/screens/weight_entry.dart';
import 'package:flutter/services.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => Home(),
      '/home': (context) => Home(),
      '/truck': (context) => Truck(),
      '/trailer': (context) => Trailer(),
      '/weight': (context) => Weight(),
      '/current_trip': (context) => CurrentTrip(),
      '/truck_entry': (context) => TruckEntry(),
      '/trailer_entry':(context) => TrailerEntry(),
    },
  ));}
