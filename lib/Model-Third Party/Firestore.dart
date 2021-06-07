import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:to_do/Model-Third Party/sharedPreferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:to_do/View-UI/ListTile.dart';
import 'package:flutter/material.dart';

class FireStore {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  SharedPreferencesForDeviceID spdeviceID = SharedPreferencesForDeviceID();
  //var listStream = getCollectionName();
//create initial collection with device ID
  Future get _deviceID => spdeviceID.getDeviceID();

  addItemToDocuments(value) async {
    if (value != null) {
      String _deviceID = await spdeviceID.getDeviceID();
      firestore.collection('$_deviceID').doc().set({'item': value});
      Trigger().toggleFade();
    }
  }

  deleteItemFromDocuments(id) async {
    if (id != null) {
      String _deviceID = await spdeviceID.getDeviceID();
      firestore.collection('$_deviceID').doc(id).delete();
    }
  }
//Add item to list

//delete item from list
}

class Trigger extends ChangeNotifier {
  bool fade = false;

  toggleFade() {
    fade = true;
    notifyListeners();
  }
}
