import 'package:floor/floor.dart';

class EntityBase {
  EntityBase(this.createdIn, this.code);

  @PrimaryKey(autoGenerate: true)
  final int? code;
  final String createdIn;
}
