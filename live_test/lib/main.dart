import 'package:flutter/material.dart';
import 'list_screen.dart';

void main() => runApp(ContactApp());

class ContactApp extends StatelessWidget {
  const ContactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactListScreen(),
    );
  }
}
