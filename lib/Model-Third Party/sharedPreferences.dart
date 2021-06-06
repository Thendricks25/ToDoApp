// here will house the code to get and set the device ID shared preference
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/View Model/UniqueDeviceID.dart';

class SharedPreferencesForDeviceID {
  CreateDeviceID _createDeviceID = CreateDeviceID();

  checkForDeviceID() {
    getDeviceID().then((value) {
      if (value == null) {
        print("No device ID set up. Setting up device ID.");
        setDeviceID().whenComplete(() {
          getDeviceID();
          print("Device ID is set.");
        });
      }
    });
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
//2076 2021-06-05 22:41:41.398766
