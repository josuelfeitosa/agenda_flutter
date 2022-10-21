import 'package:crud_agenda/app/database/sqlite/dao/contact_dao_impl.dart';
import 'package:crud_agenda/app/domain/entities/contact.dart';
import 'package:crud_agenda/app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class ContactList extends StatelessWidget {
  //const ContactList({super.key});

  Future<List<Contact>> _buscar() async {
    return ContactDAOImpl().find();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _buscar(),
        builder: (context, futuro) {
          if (futuro.hasData) {
            List<Contact>? lista = futuro.data;
            return Scaffold(
              appBar: AppBar(
                title: Text('Lista de Contatos'),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(MyApp.CONTACT_FORM);
                    },
                    icon: Icon(Icons.add),
                  )
                ],
              ),
              body: ListView.builder(
                itemCount: lista!.length,
                itemBuilder: ((context, i) {
                  var contato = lista[i];
                  var avatar = CircleAvatar(
                    backgroundImage: NetworkImage(contato.urlAvatar),
                  );
                  return ListTile(
                    leading: avatar,
                    title: Text(contato.nome),
                    subtitle: Text(contato.telefone),
                    trailing: Container(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        )),
                  );
                }),
              ),
            );
          } else {
            return Scaffold();
          }
        });
  }
}
