import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:trip_app/models/arrival_model.dart';

class ArrivalHelper {

  static final ArrivalHelper instance = ArrivalHelper._instance();
  static Database _arrivalDB;

  ArrivalHelper._instance();

  String arrivalTable = 'arrival_table';
  String idCol = 'id';
  String bolNumberCol = 'bolNumber';
  String poNumberCol = 'poNumber';
  String ldNumberCol = 'ldNumber';
  String cfNumberCol = 'cfNumber';
  String odometer0Col = 'odometer0';
  String odometer1Col = 'odometer1';
  String milesDrivenCol = 'milesDriven';
  String sealCol = 'seal';
  String hoursCol = 'hours';
  String weightCol = 'weight';
  String pcsCol = 'pcs';
  String palletLengthCol = 'palletLength';
  String maxPayload = 'maxPayload';

  Future<Database> get db async {
    if (_arrivalDB == null) {
      _arrivalDB = await _initArrivalDB();
    }
    return _arrivalDB;
  }

  Future<Database> _initArrivalDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'arrival.db';
    final arrivalDB = await openDatabase(
        path, version: 1, onCreate: _createArrivalDB);
    return arrivalDB;
  }

  void _createArrivalDB(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $arrivalTable($idCol TEXT, $bolNumberCol TEXT, $poNumberCol TEXT, $ldNumberCol TEXT, '
          '$cfNumberCol TEXT, $odometer0Col TEXT, $odometer1Col TEXT, $milesDrivenCol TEXT,'
          '$sealCol TEXT, $hoursCol TEXT, $weightCol TEXT, $pcsCol TEXT, $palletLengthCol TEXT,'
          '$maxPayload TEXT)',
    );
  }

  Future<List<Map<String, dynamic>>> getArrivalMapList() async {
    Database db = await this.db;
    final List<Map<String, dynamic>> result = await db.query(arrivalTable);
    return result;
  }

  Future<List<ArrivalModel>> getArrivalList() async {
    final List<Map<String, dynamic>> arrivalMapList = await getArrivalMapList();

    final List<ArrivalModel> arrivalList = [];
    arrivalMapList.forEach((arrivalMap){
      arrivalList.add(ArrivalModel.fromMap(arrivalMap));
    });
    return arrivalList;
  }

  Future<int> insertArrival(ArrivalModel arrival) async {
    Database db = await this.db;
    final int result = await db.insert(arrivalTable, arrival.toMap());
    return result;
  }

  Future<int> updateArrival(ArrivalModel arrival) async {
    Database db = await this.db;
    final int result = await db.update(
      arrivalTable,
      arrival.toMap(),
      where: '$idCol = ?',
      whereArgs: [arrival.id],
    );
    return result;
  }

  Future<int> deleteArrival(int id) async {
    Database db = await this.db;
    final int result = await db.delete(
      arrivalTable,
      where: '$idCol = ?',
    ); return result;
  }
}