import 'package:esecure/db/contact_helper.dart';
import 'package:esecure/model/contact_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

enum OrderOptions { orderaz, orderza }

class ContactView extends StatefulWidget {
  @override
  _ContactViewState createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  ContactHelper helper = ContactHelper();

  List<dynamic> contacts = [];

  @override
  void initState() {
    super.initState();

    _getAllContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
        backgroundColor: Colors.purple.shade700,
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<OrderOptions>(
            itemBuilder: (context) => <PopupMenuEntry<OrderOptions>>[
              const PopupMenuItem<OrderOptions>(
                child: Text("Sort by A-Z"),
                value: OrderOptions.orderaz,
              ),
              const PopupMenuItem<OrderOptions>(
                child: Text("Sort by Z-A"),
                value: OrderOptions.orderza,
              ),
            ],
            onSelected: _orderList,
          )
        ],
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showContactPage();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purple.shade700,
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(10.0),
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return _contactCard(context, index);
          }),
    );
  }

  Widget _contactCard(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      contacts[index].name ?? "",
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      contacts[index].phone ?? "",
                      style: TextStyle(fontSize: 16.0),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        _showOptions(context, index);
      },
    );
  }

  void _showOptions(BuildContext context, int index) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomSheet(
            onClosing: () {},
            builder: (context) {
              return Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 35.0,
                    ),
                    GestureDetector(
                      child: Text(
                        "Call",
                        style: TextStyle(
                            color: Colors.purple.shade700, fontSize: 20.0),
                      ),
                      onTap: () {
                        launch("tel:${contacts[index].phone}");
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    GestureDetector(
                      child: Text(
                        "Edit",
                        style: TextStyle(
                            color: Colors.purple.shade700, fontSize: 20.0),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        _showContactPage(contact: contacts[index]);
                      },
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    GestureDetector(
                      child: Text(
                        "Delete",
                        style: TextStyle(
                            color: Colors.purple.shade700, fontSize: 20.0),
                      ),
                      onTap: () {
                        helper.deleteContact(contacts[index].id);
                        setState(() {
                          contacts.removeAt(index);
                          Navigator.pop(context);
                        });
                      },
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                  ],
                ),
              );
            },
          );
        });
  }

  void _showContactPage({Contact? contact}) async {
    final recContact = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ContactPage(
                  contact: contact,
                )));
    if (recContact != null) {
      if (contact != null) {
        await helper.updateContact(recContact);
      } else {
        await helper.saveContact(recContact);
      }
      _getAllContacts();
    }
  }

  void _getAllContacts() {
    helper.getAllContacts().then((list) {
      setState(() {
        contacts = list;
      });
    });
  }

  void _orderList(OrderOptions result) {
    switch (result) {
      case OrderOptions.orderaz:
        contacts.sort((a, b) {
          return a.name.toLowerCase().compareTo(b.name.toLowerCase());
        });
        break;
      case OrderOptions.orderza:
        contacts.sort((a, b) {
          return b.name.toLowerCase().compareTo(a.name.toLowerCase());
        });
        break;
    }
    setState(() {});
  }
}
