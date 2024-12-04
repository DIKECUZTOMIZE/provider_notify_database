import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Local State tot judi Provider use kora najai tatia StateLess tu
/// Statfule convert kuribo lagibo, nuhili Vlaue Reflect/ Show nukuribo,
/// Not Use provider khai karone local state handl kora hoise aru Statfull use kora hoise, state update

void main() {
  runApp(StaticApp());
}

class StaticApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: ListHomePage(),
    );
  }
}

class ListHomePage extends StatefulWidget {
  @override
  State<ListHomePage> createState() => _ListHomePageState();
}

class _ListHomePageState extends State<ListHomePage> {
  List<Map<String, dynamic>> mData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListHomePage'),
      ),

      /// get all list element
      body: ListView.builder(
          itemCount: mData.length,
          itemBuilder: (context, index) => ListTile(
              title: Text(mData[index]['name']),
              subtitle:Text( mData[index]['phonNo']))),

      ///  Button throw Logic
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ///  List and map data Add kora hoise aite
          mData.add({
            'name': 'sanjit',
            'phonNo': '9678844'});

             setState(() {});
        },
        child: Text('Add'),
      ),
    );
  }
}
