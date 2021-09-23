import 'package:app_cadastro_pessoas/repository/irepository.dart';
import 'package:app_cadastro_pessoas/model/person.dart';
import 'package:floor/floor.dart';

@dao
abstract class PersonRepositoryDAO extends IRepositoryDAO<Person> {
  @Query('SELECT * FROM Person')
  Future<List<Person>> getAll();
}
