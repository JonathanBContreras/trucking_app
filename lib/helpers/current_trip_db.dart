import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:trip_app/models/current_trip_model.dart';

class TruckNumberHelper {

  static final TruckNumberHelper instance = TruckNumberHelper._instance();
  static Database _truckDB;

  TruckNumberHelper._instance();

  String truckNumberTable = 'truckNumberTable';
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
      'CREATE TABLE $truckNumberTable($idCol TEXT, $licensePlateCol TEXT, $stateCol TEXT)',
    );
  }

  Future<List<Map<String, dynamic>>> getTruckNumberMapList() async {
    Database db = await this.db;
    final List<Map<String, dynamic>> result = await db.query(truckNumberTable);
    return result;
  }

  Future<List<TruckNumber>> getTruckNumberList() async {
    final List<Map<String, dynamic>> TruckNumberList = await getTruckNumberMapList();

    final List<TruckNumber> truckNumberList = [];
    truckNumberList.forEach(truckNumberMap){
      truckNumberList.add(TruckNumber.fromMap(truckNumberMap));
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