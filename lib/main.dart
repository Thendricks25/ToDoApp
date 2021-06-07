import 'package:flutter/material.dart';
import 'package:to_do/View-UI/List_Stream.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Model-Third Party/Firestore.dart';
import 'Model-Third Party/sharedPreferences.dart';
import 'Services.dart';
import 'View-UI/ListTile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  var id;
  needThis() async {
    await spdeviceID.checkForDeviceID().then((value) {
      setState(() {
        id = value;
      });
    });
  }

  FireStore database = serviceLocator<FireStore>();
  SharedPreferencesForDeviceID spdeviceID =
      serviceLocator<SharedPreferencesForDeviceID>();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    needThis();
    // TODO: implement initState
    super.initState();
  }

  String additionToList = "dummyValue";
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
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
                database.deleteItemFromDocuments(data);
              },
            )
          ],
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.amberAccent,
                    child: TextField(
                        controller: _controller,
                        onChanged: (value) {
                          print(value);
                          additionToList = value;
                        }),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    child: Icon(
                      Icons.add_circle,
                      color: Colors.purple,
                    ),
                    onPressed: () {
                      database.addItemToDocuments(additionToList);
                      //print(additionToList);
                    },
                  ),
                )
              ],
            ),
            ToDoListStream(
              deviceID: id,
            ),
          ],
        ));
  }
}

getValue(value) {
  var additionToList = value;
  return additionToList;
}
