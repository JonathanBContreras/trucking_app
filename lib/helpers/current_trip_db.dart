import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:trip_app/models/current_trip_model.dart';

class TruckHelper {

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

  Future<List<TruckModel>> getTruckList() async {
    final List<Map<String, dynamic>> truckMapList = await getTruckMapList();

    final List<TruckModel> truckList = [];
    truckMapList.forEach((truckMap){
      truckList.add(TruckModel.fromMap(truckMap));
    });
    return truckList;
  }

  Future<int> insertTruck(TruckModel truck) async {
    Database db = await this.db;
    final int result = await db.insert(truckTable, truck.toMap());
    return result;
  }

  Future<int> updateTruck(TruckModel truck) async {
    Database db = await this.db;
    final int result = await db.update(
      truckTable,
      truck.toMap(),
      where: '$idCol = ?',
      whereArgs: [truck.id],
    );
    return result;
  }

  Future<int> deleteTruck(int id) async {
    Database db = await this.db;
    final int result = await db.delete(
      truckTable,
      where: '$idCol = ?',
    ); return result;
  }
}