import 'package:flutter/material.dart';
import 'package:to_do/Model-Third%20Party/sharedPreferences.dart';
import 'ToDoHomePage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    pleaseWork();
    super.initState();
  }

  pleaseWork() async {
    SharedPreferencesForDeviceID prefs = SharedPreferencesForDeviceID();
    var deviceID = await prefs.getDeviceID();
    print(deviceID);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ToDoAppHomePage(
                  id: deviceID,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('To do',
                style: TextStyle(fontSize: 25, color: Colors.lightBlue)),
            SizedBox(
              height: 25,
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
