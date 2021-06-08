import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do/View-UI/ListTile.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class ToDoListStream extends StatefulWidget {
  ToDoListStream({this.deviceID});
  final deviceID;
  @override
  _ToDoListStreamState createState() => _ToDoListStreamState();
}

class _ToDoListStreamState extends State<ToDoListStream> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collection('${widget.deviceID}').snapshots(),
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
