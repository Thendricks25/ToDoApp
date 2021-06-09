// here will house the code to get and set the device ID shared preference
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/View Model/UniqueDeviceID.dart';

class SharedPreferencesForDeviceID {
  CreateDeviceID _createDeviceID = CreateDeviceID();

  setDeviceID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var uniqueID = _createDeviceID.createDeviceID();
    prefs.setString('deviceID', uniqueID);
  }

  getDeviceID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var gotDeviceID = prefs.getString('deviceID');
    if (gotDeviceID == null) {
      setDeviceID();
      getDeviceID();
    }
    print(gotDeviceID);
    return gotDeviceID;
  }
}
