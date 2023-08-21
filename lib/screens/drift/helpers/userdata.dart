
import 'package:drift/drift.dart';

class UserData extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().named('user_name')();
  TextColumn get firstName => text().named('first_name')();
  TextColumn get lastName => text().named('last_name')();
  TextColumn get hobby => text().named("hobby")();

}

class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().named('user_name')();

}
