import 'package:ane/provider/List/list_provider/listPage1.dart';
import 'package:ane/provider/List/list_provider/list_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///  Globale State Handl korara babe commit kora houise
// List<Map<String,dynamic>> mData=[];
/// Provider use :
void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ListProvideFilse(), child: ListApp()));
}

class ListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: ListHomePage(),
    );
  }
}

class ListHomePage extends StatelessWidget {
  /// Global biona hoise jate Khukuloe use kuribi pare pakger dhara
  // List<Map<String,dynamic>> mData=[];
  @override
  Widget build(BuildContext context) {

    /// Watch/Listen:
     var mData = context.watch<ListProvideFilse>().getFect();
    // var mData = Provider.of<ListProvideFilse>(context).getFect();


    return Scaffold(
      appBar: AppBar(
        title: Text(" List Home Page"),
      ),
      body: ListView.builder(
        itemCount: mData.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(mData[index]['name']),
          subtitle: Text(mData[index]['phonNo']),
          trailing: SizedBox(
            width: 70,
            child: Row(
              children: [

                InkWell(
                  onTap: (){
                    context.read<ListProvideFilse>().update(name: 'raju', phonNo:' 9678844797', index: index);
                  },
                  child: Icon(Icons.edit),
                ),

                InkWell(
                  onTap: (){
                    context.read<ListProvideFilse>().delet(index:index);
                  },
                  child: Icon(Icons.delete,color: Colors.red,),
                ),


              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListPage1(),
              ));
        },
        child: Text('Next'),
      ),
    );
  }
}
