import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:trip_app/models/fuel_model.dart';

class FuelHelper {

  static final FuelHelper instance = FuelHelper._instance();
  static Database _fuelDB;

  FuelHelper._instance();

  String fuelTable = 'fuel_table';
  String idCol = 'id';
  String cityCol = 'city';
  String stateCol = 'state';
  String stationCol = 'station';
  String highwayCol = 'highway';
  String mileMarkerCol = 'mileMarker';
  String odometerCol = 'odometer';
  String dieselAmountCol = 'dieselAmount';
  String dieselPriceCol = 'dieselPrice';
  String defCol = 'def';
  String startingFuelCol = 'startingFuel';
  String endFuelCol = 'endFuel';

  Future<Database> get db async {
    if (_fuelDB == null) {
      _fuelDB = await _initfuelDB();
    }
    return _fuelDB;
  }

  Future<Database> _initfuelDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'fuel.db';
    final fuelDB = await openDatabase(
        path, version: 1, onCreate: _createFuelDB);
    return fuelDB;
  }

  void _createFuelDB(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $fuelTable($idCol TEXT, $cityCol TEXT, $stateCol TEXT, $stationCol TEXT,'
          '$highwayCol TEXT, $mileMarkerCol TEXT, $odometerCol TEXT, $dieselAmountCol TEXT,'
          '$dieselPriceCol TEXT, $defCol TEXT, $startingFuelCol TEXT, $endFuelCol)',
    );
  }

  Future<List<Map<String, dynamic>>> getFuelMapList() async {
    Database db = await this.db;
    final List<Map<String, dynamic>> result = await db.query(fuelTable);
    return result;
  }

  Future<List<FuelModel>> getFuelList() async {
    final List<Map<String, dynamic>> fuelMapList = await getFuelMapList();

    final List<FuelModel> fuelList = [];
    fuelMapList.forEach((fuelMap){
      fuelList.add(FuelModel.fromMap(fuelMap));
    });
    return fuelList;
  }

  Future<int> insertFuel(FuelModel fuel) async {
    Database db = await this.db;
    final int result = await db.insert(fuelTable, fuel.toMap());
    return result;
  }

  Future<int> updateFuel(FuelModel weight) async {
    Database db = await this.db;
    final int result = await db.update(
      fuelTable,
      weight.toMap(),
      where: '$idCol = ?',
      whereArgs: [weight.id],
    );
    return result;
  }

  Future<int> deleteFuel(int id) async {
    Database db = await this.db;
    final int result = await db.delete(
      fuelTable,
      where: '$idCol = ?',
    ); return result;
  }
}