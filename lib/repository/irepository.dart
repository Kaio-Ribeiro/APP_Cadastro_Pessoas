import 'package:app_cadastro_pessoas/model/entity_base.dart';
import 'package:floor/floor.dart';

abstract class IRepositoryDAO<Model extends EntityBase> {
  @insert
  Future<int> insertItem(Model item);

  @update
  Future<int> updateItem(Model item);

  @delete
  Future<int> deleteItem(Model item);
}
