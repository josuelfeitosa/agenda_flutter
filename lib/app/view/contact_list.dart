import 'package:crud_agenda/app/domain/entities/contact.dart';
import 'package:crud_agenda/app/my_app.dart';
import 'package:crud_agenda/app/view/contact_list_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ContactList extends StatelessWidget {
  //const ContactList({super.key});

  final _back = ContactListBack();

  CircleAvatar circleAvatar(String url) {
    return (Uri.tryParse(url)!.isAbsolute)
        ? CircleAvatar(backgroundImage: NetworkImage(url))
        : CircleAvatar(child: Icon(Icons.person));
    /*
    try {
      return CircleAvatar(backgroundImage: NetworkImage(url));
    } catch (e) {
      return CircleAvatar(child: Icon(Icons.person));
    }*/
  }

  Widget iconEditButton(Function() onPressed) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(Icons.edit),
      color: Colors.orange,
    );
  }

  Widget iconRemoveButton(BuildContext context, Function() remove) {
    return IconButton(
      icon: Icon(Icons.delete),
      color: Colors.red,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Excluir'),
            content: Text('Confirma a Exclusão?'),
            actions: [
              TextButton(
                child: Text('Não'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Sim'),
                onPressed: remove,
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Contatos'),
        actions: [
          IconButton(
            onPressed: () {
              _back.goToForm(context);
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Observer(
        builder: (context) {
          return FutureBuilder(
            future: _back.list,
            builder: (context, futuro) {
              if (!futuro.hasData) {
                return CircularProgressIndicator();
              } else {
                List<Contact>? lista = futuro.data;
                return ListView.builder(
                  itemCount: lista!.length,
                  itemBuilder: ((context, i) {
                    var contato = lista[i];

                    return ListTile(
                      leading: circleAvatar(contato.urlAvatar!),
                      title: Text(contato.nome!),
                      subtitle: Text(contato.telefone!),
                      trailing: Container(
                          width: 100,
                          child: Row(
                            children: [
                              iconEditButton(() {
                                _back.goToForm(context, contato);
                              }),
                              iconRemoveButton(context, () {
                                _back.remove(contato.id!);
                                Navigator.of(context).pop();
                              }),
                            ],
                          )),
                    );
                  }),
                );
              }
            },
          );
        },
      ),
    );
  }
}
