import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:trip_app/models/weight_model.dart';

class WeightHelper {

  static final WeightHelper instance = WeightHelper._instance();
  static Database _weightDB;

  WeightHelper._instance();

  String weightTable = 'weight_table';
  String idCol = 'id';
  String tripNumCol = 'tripNum';
  String steersCol = 'steers';
  String drivesCol = 'drives';
  String trailerTandomsCol = 'trailerTandoms';
  String tractorCol = 'tractor';
  String drvsAndTrtandCol = 'drvsAndTrtand';
  String fuelWeightCol = 'fuelWeight';
  String grossWeightCol = 'grossWeight';

  Future<Database> get db async {
    if (_weightDB == null) {
      _weightDB = await _initWeightDB();
    }
    return _weightDB;
  }

  Future<Database> _initWeightDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'weight.db';
    final weightDB = await openDatabase(
        path, version: 1, onCreate: _createWeightDB);
    return weightDB;
  }

  void _createWeightDB(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $weightTable($idCol TEXT, $tripNumCol TEXT, $steersCol TEXT, $drivesCol TEXT,'
          '$trailerTandomsCol TEXT, $tractorCol TEXT, $drvsAndTrtandCol TEXT, $fuelWeightCol TEXT,'
          '$grossWeightCol TEXT)',
    );
  }

  Future<List<Map<String, dynamic>>> getWeightMapList() async {
    Database db = await this.db;
    final List<Map<String, dynamic>> result = await db.query(weightTable);
    return result;
  }

  Future<List<WeightModel>> getWeightList() async {
    final List<Map<String, dynamic>> weightMapList = await getWeightMapList();

    final List<WeightModel> weightList = [];
    weightMapList.forEach((weightMap){
      weightList.add(WeightModel.fromMap(weightMap));
    });
    return weightList;
  }

  Future<int> insertWeight(WeightModel weight) async {
    Database db = await this.db;
    final int result = await db.insert(weightTable, weight.toMap());
    return result;
  }

  Future<int> updateWeight(WeightModel weight) async {
    Database db = await this.db;
    final int result = await db.update(
      weightTable,
      weight.toMap(),
      where: '$idCol = ?',
      whereArgs: [weight.id],
    );
    return result;
  }

  Future<int> deleteWeight(int id) async {
    Database db = await this.db;
    final int result = await db.delete(
      weightTable,
      where: '$idCol = ?',
    ); return result;
  }
}