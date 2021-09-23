import 'package:app_cadastro_pessoas/screens/home_page.dart';
import 'package:flutter/material.dart';

import 'database/database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(
    bd: await $FloorDatabaseApp
        .databaseBuilder('app_database_person.db')
        .build(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.bd}) : super(key: key);
  final DatabaseApp bd;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      home: HomePage(bd: bd),
    );
  }
}
