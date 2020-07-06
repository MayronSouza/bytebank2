import 'package:bytebank2/components/contact_item.dart';
import 'package:bytebank2/components/progress.dart';
import 'package:bytebank2/database/dao/contactDao.dart';
import 'package:bytebank2/models/contact.dart';
import 'package:bytebank2/screens/contact_form.dart';
import 'package:bytebank2/screens/transaction_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  final ContactDao _dao = ContactDao();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: List(),
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contact> contacts = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contact contact = contacts[index];
                  return ContactItem(
                    contact,
                    onClick: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TransactionForm(contact),
                        ),
                      );
                    },
                  );
                },
                itemCount: contacts.length,
              );
              break;
          }
          return Text('Unknown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return ContactForm();
              },
            ),
          ).then((value) {
            setState(() {
              widget.createState();
            });
          });
        },
      ),
    );
  }
}
