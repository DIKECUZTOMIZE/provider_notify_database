

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_database/provider/database_provider/dataBaseHomePage1.dart';
import 'package:provider_database/provider/database_provider/databaseProvider.dart';

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

