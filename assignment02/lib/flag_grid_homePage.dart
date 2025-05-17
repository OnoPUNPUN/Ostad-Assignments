import 'package:flutter/material.dart';

import 'responsive_grid.dart';

class FlagGridHomePage extends StatelessWidget {
  const FlagGridHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(title: const Text('Perfect Responsive Flag Grid')),
      body: const Padding(
        padding: EdgeInsets.all(12.0),
        child: ResponsiveGrid(),
      ),
    );
  }
}