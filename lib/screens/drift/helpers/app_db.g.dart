// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $UserDataTable extends UserData
    with TableInfo<$UserDataTable, UserDataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserDataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'user_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hobbyMeta = const VerificationMeta('hobby');
  @override
  late final GeneratedColumn<String> hobby = GeneratedColumn<String>(
      'hobby', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, firstName, lastName, hobby];
  @override
  String get aliasedName => _alias ?? 'user_data';
  @override
  String get actualTableName => 'user_data';
  @override
  VerificationContext validateIntegrity(Insertable<UserDataData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['user_name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('hobby')) {
      context.handle(
          _hobbyMeta, hobby.isAcceptableOrUnknown(data['hobby']!, _hobbyMeta));
    } else if (isInserting) {
      context.missing(_hobbyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserDataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserDataData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_name'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      hobby: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hobby'])!,
    );
  }

  @override
  $UserDataTable createAlias(String alias) {
    return $UserDataTable(attachedDatabase, alias);
  }
}

class UserDataData extends DataClass implements Insertable<UserDataData> {
  final int id;
  final String name;
  final String firstName;
  final String lastName;
  final String hobby;
  const UserDataData(
      {required this.id,
      required this.name,
      required this.firstName,
      required this.lastName,
      required this.hobby});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_name'] = Variable<String>(name);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    map['hobby'] = Variable<String>(hobby);
    return map;
  }

  UserDataCompanion toCompanion(bool nullToAbsent) {
    return UserDataCompanion(
      id: Value(id),
      name: Value(name),
      firstName: Value(firstName),
      lastName: Value(lastName),
      hobby: Value(hobby),
    );
  }

  factory UserDataData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserDataData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      hobby: serializer.fromJson<String>(json['hobby']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'hobby': serializer.toJson<String>(hobby),
    };
  }

  UserDataData copyWith(
          {int? id,
          String? name,
          String? firstName,
          String? lastName,
          String? hobby}) =>
      UserDataData(
        id: id ?? this.id,
        name: name ?? this.name,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        hobby: hobby ?? this.hobby,
      );
  @override
  String toString() {
    return (StringBuffer('UserDataData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('hobby: $hobby')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, firstName, lastName, hobby);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserDataData &&
          other.id == this.id &&
          other.name == this.name &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.hobby == this.hobby);
}

class UserDataCompanion extends UpdateCompanion<UserDataData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String> hobby;
  const UserDataCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.hobby = const Value.absent(),
  });
  UserDataCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String firstName,
    required String lastName,
    required String hobby,
  })  : name = Value(name),
        firstName = Value(firstName),
        lastName = Value(lastName),
        hobby = Value(hobby);
  static Insertable<UserDataData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? hobby,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'user_name': name,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (hobby != null) 'hobby': hobby,
    });
  }

  UserDataCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? firstName,
      Value<String>? lastName,
      Value<String>? hobby}) {
    return UserDataCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      hobby: hobby ?? this.hobby,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['user_name'] = Variable<String>(name.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (hobby.present) {
      map['hobby'] = Variable<String>(hobby.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserDataCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('hobby: $hobby')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $UserDataTable userData = $UserDataTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [userData];
}
