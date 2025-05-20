import 'package:flutter/material.dart';
import 'contact.dart';
import 'contact_list.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final List<Contact> _contacts = [];

  void _addContact() {
    final name = _nameController.text.trim();
    final number = _numberController.text.trim();

    if (name.isNotEmpty && number.isNotEmpty) {
      setState(() {
        _contacts.add(Contact(name: name, number: number));
        _nameController.clear();
        _numberController.clear();
      });
    }
  }

  void _showDeleteConfirmation(int index) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Confirmation'),
            content: Text('Are you sure for Delete?'),
            actions: [
              IconButton(
                icon: Icon(Icons.cancel, color: Colors.blueGrey),
                onPressed: () => Navigator.of(context).pop(),
              ),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    _contacts.removeAt(index);
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text('Contact List', style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            color: Colors.grey.shade300,
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _numberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Number',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _addContact,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                    ),
                    child: Text('Add', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _contacts.length,
              itemBuilder: (context, index) {
                return ContactTile(
                  contact: _contacts[index],
                  onLongPress: () => _showDeleteConfirmation(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
