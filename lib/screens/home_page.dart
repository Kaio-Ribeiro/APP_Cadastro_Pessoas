import 'package:app_cadastro_pessoas/database/database.dart';
import 'package:app_cadastro_pessoas/model/person.dart';
import 'package:app_cadastro_pessoas/screens/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.bd}) : super(key: key);
  final DatabaseApp bd;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
        onPressed: () async {
          var result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return RegisterPage(bd: widget.bd);
              },
            ),
          );
          if (result) {
            setState(() {});
          }
        },
        child: Icon(Icons.add),
      ),
      appBar: new AppBar(
        title: Text("Página Inicial"),
      ),
      body: FutureBuilder<List<Person>>(
        future: widget.bd.personRepositoryDAO.getAll(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(snapshot.data![index].name),
                        subtitle: Text(snapshot.data![index].contact),
                      ),
                    );
                  },
                )
              : Center(
                  child: Text("Sem dados cadastrados!"),
                );
        },
      ),
    );
  }
}
