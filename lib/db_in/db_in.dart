import 'package:clock_in/db_in/in_entity.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBIn extends GetxService {
  late Database dbBase;

  Future<DBIn> init() async {
    await createInDB();
    return this;
  }

  createInDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'clock.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await createInTable(db);
    });
  }

  createInTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS clock (id INTEGER PRIMARY KEY, createdTime TEXT, type INTEGER, inStyle TEXT, atInTime TEXT, local TEXT, remark TEXT)');
  }

  insertIn(InEntity entity) async {
    final id = await dbBase.insert('clock', {
      'createdTime': entity.createdTime.toIso8601String(),
      'type': entity.type,
      'inStyle': entity.inStyle,
      'atInTime': entity.atInTime.toIso8601String(),
      'local': entity.local,
      'remark': entity.remark
    });
    return id;
  }

  cleanInData() async {
    await dbBase.delete('clock');
  }

  Future<List<InEntity>> getInAllData() async {
    var result = await dbBase.query('clock', orderBy: 'createdTime DESC');
    return result.map((e) => InEntity.fromJson(e)).toList();
  }
}
