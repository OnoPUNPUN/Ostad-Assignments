import 'package:flutter/material.dart';
import 'contact.dart';

class ContactTile extends StatelessWidget {
  final Contact contact;
  final VoidCallback onLongPress;

  const ContactTile({super.key, required this.contact, required this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.account_circle, color: Colors.brown, size: 30),
      title: Text(
        contact.name,
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(contact.number),
      trailing: Icon(Icons.phone, color: Colors.blue),
      onLongPress: onLongPress,
    );
  }
}
