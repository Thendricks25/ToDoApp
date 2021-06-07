import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do/Model-Third%20Party/Firestore.dart';
import 'package:to_do/Model-Third%20Party/sharedPreferences.dart';
import 'package:to_do/Services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/View-UI/AnimatedEntry.dart';
import 'package:to_do/View-UI/ListTile.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class ToDoListStream extends StatefulWidget {
  ToDoListStream({this.deviceID});
  final deviceID;
  @override
  _ToDoListStreamState createState() => _ToDoListStreamState();
}

class _ToDoListStreamState extends State<ToDoListStream> {
  FireStore stream = serviceLocator<FireStore>();
  SharedPreferencesForDeviceID deviceID =
      serviceLocator<SharedPreferencesForDeviceID>();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      //${deviceID.getDeviceID()}
      stream:
          firestore.collection('2076 2021-06-05 22:41:41.398766').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Error");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.data.docs == null) {
          return Center(child: Icon(Icons.check, color: Colors.red));
        }
        final items = snapshot.data.docs;
        List<ListBlock> itemBlocks = [];
        for (var item in items) {
          final newItem = item['item'];
          //print(newItem);
          final id = item.id;
          final listBlock = ListBlock(item: newItem, id: id);
          itemBlocks.add(listBlock);
        }
        return Expanded(
          child: ListView(
            children: itemBlocks,
          ),
        );
      },
    );
  }
}
