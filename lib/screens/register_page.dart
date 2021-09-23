import 'package:app_cadastro_pessoas/database/database.dart';
import 'package:app_cadastro_pessoas/model/person.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key, required this.bd}) : super(key: key);
  final DatabaseApp bd;

  final _nameController = new TextEditingController(text: '');
  final _contactController = new TextEditingController(text: '');
  final _addressController = new TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          if (_nameController.text.isNotEmpty &&
              _contactController.text.isNotEmpty &&
              _addressController.text.isNotEmpty) {
            bd.personRepositoryDAO.insertItem(new Person(
              createdIn: DateTime.now().toUtc().toString(),
              name: _nameController.text,
              contact: _contactController.text,
              address: _addressController.text,
            ));
            Navigator.pop(context, true);
          }
        },
        child: Icon(Icons.save),
      ),
      appBar: new AppBar(
        title: Text("Registrar Usuário"),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: new SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: new Column(
          children: <Widget>[
            new TextField(
              controller: _nameController,
              decoration: InputDecoration(hintText: "Digite o nome do usuário"),
              maxLines: 5,
            ),
            new TextField(
              controller: _contactController,
              decoration: InputDecoration(
                  hintText: "Digite o número de contato do usuário"),
              maxLines: 5,
            ),
            new TextField(
              controller: _addressController,
              decoration:
                  InputDecoration(hintText: "Digite o endereço do usuário"),
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
