import 'package:flutter/material.dart';
import 'package:trip_app/screens/home.dart';
import 'package:trip_app/screens/truck.dart';
import 'package:trip_app/screens/trailer.dart';
import 'package:trip_app/screens/weight.dart';
import 'package:trip_app/screens/fuel.dart';
import 'package:trip_app/screens/destination.dart';
import 'package:trip_app/screens/current_trip.dart';
import 'package:trip_app/screens/truck_entry.dart';
import 'package:trip_app/screens/trailer_entry.dart';
import 'package:trip_app/screens/weight_entry.dart';
import 'package:trip_app/screens/fuel_entry.dart';
import 'package:trip_app/screens/destination_entry.dart';
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
      '/fuel': (context) => Fuel(),
      '/destination': (context) => Destination(),
      '/current_trip': (context) => CurrentTrip(),
      '/truck_entry': (context) => TruckEntry(),
      '/trailer_entry':(context) => TrailerEntry(),
      '/weight_entry': (context) => WeightEntry(),
      '/fuel_entry': (context) => FuelEntry(),
      '/destination_entry': (context) => DestinationEntry(),
    },
  ));}
