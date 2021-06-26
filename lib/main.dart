import 'package:flutter/material.dart';
import 'package:trip_app/screens/home.dart';
import 'package:trip_app/screens/truck.dart';
import 'package:trip_app/screens/truck_entry.dart';
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
      '/current_trip': (context) => Truck(),
      '/truck_entry': (context) => TruckEntry(),
    },
  ));}
