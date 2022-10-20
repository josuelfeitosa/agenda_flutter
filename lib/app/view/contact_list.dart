import 'package:crud_agenda/app/my_app.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: ListView(),
    );
  }
}
