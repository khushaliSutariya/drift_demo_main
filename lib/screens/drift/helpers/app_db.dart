import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_demo_main/screens/drift/helpers/userdata.dart';
import 'package:path_provider/path_provider.dart';
import 'package:drift_demo_main/screens/drift/database/schema_versions.dart';
import 'package:path/path.dart' as path;


part 'app_db.g.dart';


LazyDatabase _openConnection() {
  String dbNameEmployee = 'employee.em';
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path,dbNameEmployee));

    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(tables: [UserData,Categories])
class AppDatabase extends _$AppDatabase{
  AppDatabase() : super(_openConnection());
  AppDatabase.forTesting(DatabaseConnection connection) : super(connection);

  @override
  int get schemaVersion => 3;

  // @override
  // MigrationStrategy get migration => MigrationStrategy(
  //   onCreate: (m) async {/* ... */},
  //   onUpgrade: (m, from, to) async {/* your existing migration logic */},
  //   beforeOpen: (details) async {
  //     // your existing beforeOpen callback, enable foreign keys, etc.
  //
  //   },
  // );

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: stepByStep(
        from1To2: (m, schema) async {
          await m.addColumn(schema.userData, schema.userData.dueDate);
        },
        from2To3: (m, schema) async {
          await m.addColumn(schema.userData, schema.userData.priority);
        },
      ),
      beforeOpen: (details) async{
        await customStatement('PRAGMA foreign_keys = ON');

        if(details.wasCreated){


        }
      }
    );
  }

static AppDatabase appDatabase = AppDatabase();
  //Insert data
  static Future<int> insertEmployee(UserDataCompanion entity) async {
    return await AppDatabase.appDatabase.into(AppDatabase.appDatabase.userData).insert(entity);
  }
  //view data
  static Future<List<UserDataData>> viewEmployee() async {
    return await AppDatabase.appDatabase.select(AppDatabase.appDatabase.userData).get();
  }
  //delete
  static Future<int> deleteEmployee(int id) async{
    return await (AppDatabase.appDatabase.delete(AppDatabase.appDatabase.userData)..where((eTbl) => eTbl.id.equals(id))).go();
  }

  static Future deleteAllEmployee() async{
    return await (AppDatabase.appDatabase.delete(AppDatabase.appDatabase.userData).go());
  }
  //update data
  static Future<UserDataData> getEmployee(int id) async{
    return await (AppDatabase.appDatabase.select(AppDatabase.appDatabase.userData)..where((tbl) => tbl.id.equals(id))).getSingle();
  }
  static Future<bool> updateEmployee(UserDataCompanion entity) async{
    return await AppDatabase.appDatabase.update(AppDatabase.appDatabase.userData).replace(entity);
  }




}