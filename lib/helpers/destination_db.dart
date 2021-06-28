import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:trip_app/models/destination_model.dart';

class DestinationHelper {

  static final DestinationHelper instance = DestinationHelper._instance();
  static Database _destinationDB;

  DestinationHelper._instance();

  String destinationTable = 'destination_table';
  String idCol = 'id';
  String streetNameAndNumberCol = 'streetNameAndNumber';
  String cityCol = 'city';
  String stateCol = 'state';
  String zipcodeCol = 'zipcode';
  String distributorCol = 'distributor';
  String dateCol = 'date';
  String timeCol = 'time';

  Future<Database> get db async {
    if (_destinationDB == null) {
      _destinationDB = await _initDestinationDB();
    }
    return _destinationDB;
  }

  Future<Database> _initDestinationDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'destination.db';
    final destinationDB = await openDatabase(
        path, version: 1, onCreate: _createDestinationDB);
    return destinationDB;
  }

  void _createDestinationDB(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $destinationTable($idCol TEXT, $streetNameAndNumberCol TEXT, $cityCol TEXT, $stateCol TEXT, '
          '$zipcodeCol TEXT, $distributorCol TEXT, $dateCol TEXT, $timeCol TEXT)',
    );
  }

  Future<List<Map<String, dynamic>>> getDestinationMapList() async {
    Database db = await this.db;
    final List<Map<String, dynamic>> result = await db.query(destinationTable);
    return result;
  }

  Future<List<DestinationModel>> getDestinationList() async {
    final List<Map<String, dynamic>> destinationMapList = await getDestinationMapList();

    final List<DestinationModel> destinationList = [];
    destinationMapList.forEach((destinationMap){
      destinationList.add(DestinationModel.fromMap(destinationMap));
    });
    return destinationList;
  }

  Future<int> insertDestination(DestinationModel destination) async {
    Database db = await this.db;
    final int result = await db.insert(destinationTable, destination.toMap());
    return result;
  }

  Future<int> updateDestination(DestinationModel destination) async {
    Database db = await this.db;
    final int result = await db.update(
      destinationTable,
      destination.toMap(),
      where: '$idCol = ?',
      whereArgs: [destination.id],
    );
    return result;
  }

  Future<int> deleteDestination(int id) async {
    Database db = await this.db;
    final int result = await db.delete(
      destinationTable,
      where: '$idCol = ?',
    ); return result;
  }
}