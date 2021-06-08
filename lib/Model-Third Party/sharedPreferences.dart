// here will house the code to get and set the device ID shared preference
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/View Model/UniqueDeviceID.dart';

class SharedPreferencesForDeviceID extends ChangeNotifier {
  CreateDeviceID _createDeviceID = CreateDeviceID();

  checkForDeviceID() {
    var get = getDeviceID();
    if (get == null) {
      print("No device ID set up. Setting up device ID.");
      setDeviceID().whenComplete(() {
        get = getDeviceID();
        print("Device ID is set.");
      });
    }
    return get;
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
