// here will house the code to get and set the device ID shared preference
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/View Model/UniqueDeviceID.dart';

class SharedPreferencesForDeviceID extends ChangeNotifier {
  CreateDeviceID _createDeviceID = CreateDeviceID();

  checkForDeviceID() async {
    await getDeviceID().then((value) async {
      if (value == null) {
        print("No device ID set up. Setting up device ID.");
        await setDeviceID().whenComplete(() async {
          await getDeviceID();
          notifyListeners();
          print("Device ID is set.");
        });
      }
    });
    notifyListeners();
  }

  setDeviceID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var uniqueID = _createDeviceID.createDeviceID();
    prefs.setString('deviceID', uniqueID);
  }

  getDeviceID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var gotDeviceID = prefs.getString('deviceID');
    print(gotDeviceID);
    return gotDeviceID;
  }
}
//My unique device ID: 2076 2021-06-05 22:41:41.398766
