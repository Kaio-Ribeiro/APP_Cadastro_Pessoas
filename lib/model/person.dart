import 'package:floor/floor.dart';
import 'package:app_cadastro_pessoas/model/entity_base.dart';

@entity
class Person extends EntityBase {
  Person(
      {int? code,
      required String createdIn,
      required this.name,
      required this.contact,
      required this.address})
      : super(createdIn, code);

  final String name;
  final String contact;
  final String address;
}
