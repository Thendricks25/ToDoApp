import 'dart:async';
import 'dart:math';

import 'package:to_do/Model-Third%20Party/sharedPreferences.dart';

import 'bloc.dart';

// This file is to create the random device Id
//that will be stored on the device using
//shared preferences. That ID will also be passed
//to Firebase Firestore as the title of the collection.
//That way only the device that has that ID can access that
//collection.

class CreateDeviceID {
  createDeviceID() {
    var randNum = Random.secure().nextInt(5000) + 1000;
    var date = DateTime.now();
    var deviceID = "$randNum $date";
    return deviceID;
  }
}

class DeviceIDBloc implements Bloc {
  final deviceIDController = StreamController<SharedPreferencesForDeviceID>();
  Stream<SharedPreferencesForDeviceID> get deviceIDStream =>
      deviceIDController.stream;

  sendDeviceID(deviceID) {
    deviceIDController.sink.add(deviceID);
  }

  @override
  void dispose() {
    deviceIDController.close();
  }
}
