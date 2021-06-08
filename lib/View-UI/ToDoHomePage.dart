import 'package:flutter/material.dart';
import 'package:to_do/Model-Third%20Party/Firestore.dart';
import '../Services.dart';
import 'List_Stream.dart';

class ToDoAppHomePage extends StatefulWidget {
  ToDoAppHomePage({Key key, this.id}) : super(key: key);
  final id;

  @override
  _ToDoAppHomePageState createState() => _ToDoAppHomePageState();
}

class _ToDoAppHomePageState extends State<ToDoAppHomePage> {
  FireStore database = serviceLocator<FireStore>();

  final TextEditingController _controller = TextEditingController();

  String additionToList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            DragTarget(
              builder: (context, candidateData, rejectedData) {
                return Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Icon(Icons.delete),
                );
              },
              onAccept: (data) {
                print(data);
                database.deleteItemFromDocuments(widget.id, data);
              },
            )
          ],
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("To do App"),
          centerTitle: true,
          leading: Container(),
        ),
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.width * .2,
              child: Card(
                color: Colors.blue.shade50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      //flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: TextField(
                            textAlign: TextAlign.center,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                hintText: "Enter item"),
                            controller: _controller,
                            onChanged: (value) {
                              additionToList = value;
                            }),
                      ),
                    ),
                    TextButton(
                      child: Icon(
                        Icons.add_circle,
                        color: Colors.blue,
                        size: 40,
                      ),
                      onPressed: () {
                        database.addItemToDocuments(widget.id, additionToList);
                        _controller.clear();
                      },
                    )
                  ],
                ),
              ),
            ),
            ToDoListStream(
              deviceID: widget.id,
            ),
          ],
        ));
  }
}
