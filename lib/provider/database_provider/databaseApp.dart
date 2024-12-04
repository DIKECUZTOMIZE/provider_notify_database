import 'package:ane/provider/database_provider/dataBaseHomePage1.dart';

import 'package:ane/provider/database_provider/databaseProvider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => DBProvider(), child: DatabaseProviderApp()));
}

class DatabaseProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DatabaseProviderPage1(),
    );
  }
}

