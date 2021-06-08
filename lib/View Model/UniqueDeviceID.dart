import 'dart:math';

class CreateDeviceID {
  createDeviceID() {
    var randNum = Random.secure().nextInt(5000) + 1000;
    var date = DateTime.now();
    var deviceID = "$randNum $date";
    return deviceID;
  }
}
