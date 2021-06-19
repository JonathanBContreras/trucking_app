import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:trip_app/models/current_trip_model.dart';

class TruckNumberHelper {

  static final TruckHelper instance = TruckHelper._instance();
  static Database _truckDB;

  TruckHelper._instance();

  String truckTable = 'truck_table';
  String idCol = 'id';
  String licensePlateCol = 'licensePlate';
  String stateCol = 'stateCol';

  Future<Database> get db async {
    if (_truckDB == null) {
      _truckDB = await _initTruckDB();
    }
    return _truckDB;
  }

  Future<Database> _initTruckDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'truck.db';
    final truckDB = await openDatabase(
        path, version: 1, onCreate: _createTruckDB);
    return truckDB;
  }

  void _createTruckDB(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $truckTable($idCol TEXT, $licensePlateCol TEXT, $stateCol TEXT)',
    );
  }

  Future<List<Map<String, dynamic>>> getTruckMapList() async {
    Database db = await this.db;
    final List<Map<String, dynamic>> result = await db.query(truckTable);
    return result;
  }

  Future<List<TruckNumber>> getTruckList() async {
    final List<Map<String, dynamic>> TruckMapList = await getTruckMapList();

    final List<TruckNumber> truckList = [];
    truckMapList.forEach(truckMap){
      truckList.add(TruckNumber.fromMap(truckMap));
    });
    return truckNumberList;
  }

  Future<String> updateTruckNumber(TruckNumber) async{
    Database db = await this.db;
    final String result = await db.update(
      truckNumberTable,
      truckNumber.toMap(),
      where: '$idCol = ?',
      whereArgs: [id],
    ); return result;
  }
}