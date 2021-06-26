import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:trip_app/models/trailer_model.dart';

class TrailerHelper {

  static final TrailerHelper instance = TrailerHelper._instance();
  static Database _trailerDB;

  TrailerHelper._instance();

  String trailerTable = 'trailer_table';
  String idCol = 'id';
  String trailerNumCol = 'trailerNum';
  String licensePlateCol = 'licensePlate';
  String stateCol = 'state';

  Future<Database> get db async {
    if (_trailerDB == null) {
      _trailerDB = await _initTrailerDB();
    }
    return _trailerDB;
  }

  Future<Database> _initTrailerDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'trailer.db';
    final truckDB = await openDatabase(
        path, version: 1, onCreate: _createTrailerDB);
    return truckDB;
  }

  void _createTrailerDB(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $trailerTable($idCol TEXT, $trailerNumCol TEXT, $licensePlateCol TEXT, $stateCol TEXT)',
    );
  }

  Future<List<Map<String, dynamic>>> getTrailerMapList() async {
    Database db = await this.db;
    final List<Map<String, dynamic>> result = await db.query(trailerTable);
    return result;
  }

  Future<List<TrailerModel>> getTrailerList() async {
    final List<Map<String, dynamic>> trailerMapList = await getTrailerMapList();

    final List<TrailerModel> trailerList = [];
    trailerMapList.forEach((trailerMap){
      trailerList.add(TrailerModel.fromMap(trailerMap));
    });
    return trailerList;
  }

  Future<int> insertTrailer(TrailerModel truck) async {
    Database db = await this.db;
    final int result = await db.insert(trailerTable, truck.toMap());
    return result;
  }

  Future<int> updateTrailer(TrailerModel truck) async {
    Database db = await this.db;
    final int result = await db.update(
      trailerTable,
      truck.toMap(),
      where: '$idCol = ?',
      whereArgs: [truck.id],
    );
    return result;
  }

  Future<int> deleteTrailer(int id) async {
    Database db = await this.db;
    final int result = await db.delete(
      trailerTable,
      where: '$idCol = ?',
    ); return result;
  }
}