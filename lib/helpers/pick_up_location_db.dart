import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:trip_app/models/pick_up_location_model.dart';

class PickupLocationHelper {

  static final PickupLocationHelper instance = PickupLocationHelper._instance();
  static Database _pickuplocationDB;

  PickupLocationHelper._instance();

  String pickuplocationTable = 'pickuplocation_table';
  String idCol = 'id';
  String streetNameAndNumberCol = 'streetNameAndNumber';
  String cityCol = 'city';
  String stateCol = 'state';
  String zipcodeCol = 'zipcode';
  String distributorCol = 'distributor';
  String dateCol = 'date';
  String timeCol = 'time';

  Future<Database> get db async {
    if (_pickuplocationDB == null) {
      _pickuplocationDB = await _initPickupLocationDB();
    }
    return _pickuplocationDB;
  }

  Future<Database> _initPickupLocationDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'pickuplocation.db';
    final pickuplocationDB = await openDatabase(
        path, version: 1, onCreate: _createPickupLocationDB);
    return pickuplocationDB;
  }

  void _createPickupLocationDB(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $pickuplocationTable($idCol TEXT, $streetNameAndNumberCol TEXT, $cityCol TEXT, $stateCol TEXT, '
          '$zipcodeCol TEXT, $distributorCol TEXT, $dateCol TEXT, $timeCol TEXT)',
    );
  }

  Future<List<Map<String, dynamic>>> getPickupLocationMapList() async {
    Database db = await this.db;
    final List<Map<String, dynamic>> result = await db.query(pickuplocationTable);
    return result;
  }

  Future<List<PickupLocationModel>> getPickupLocationList() async {
    final List<Map<String, dynamic>> pickuplocationMapList = await getPickupLocationMapList();

    final List<PickupLocationModel> pickuplocationList = [];
    pickuplocationMapList.forEach((pickuplocationMap){
      pickuplocationList.add(PickupLocationModel.fromMap(pickuplocationMap));
    });
    return pickuplocationList;
  }

  Future<int> insertPickupLocation(PickupLocationModel pickuplocation) async {
    Database db = await this.db;
    final int result = await db.insert(pickuplocationTable, pickuplocation.toMap());
    return result;
  }

  Future<int> updatePickupLocation(PickupLocationModel pickuplocation) async {
    Database db = await this.db;
    final int result = await db.update(
      pickuplocationTable,
      pickuplocation.toMap(),
      where: '$idCol = ?',
      whereArgs: [pickuplocation.id],
    );
    return result;
  }

  Future<int> deletePickupLocation(int id) async {
    Database db = await this.db;
    final int result = await db.delete(
      pickuplocationTable,
      where: '$idCol = ?',
    ); return result;
  }
}