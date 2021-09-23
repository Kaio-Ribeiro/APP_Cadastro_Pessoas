import 'dart:async';

import 'package:app_cadastro_pessoas/model/person.dart';
import 'package:app_cadastro_pessoas/repository/person_repository.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [Person])
abstract class DatabaseApp extends FloorDatabase {
  PersonRepositoryDAO get personRepositoryDAO;
}
