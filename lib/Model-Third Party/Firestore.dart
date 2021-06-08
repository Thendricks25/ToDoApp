import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FireStore {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  addItemToDocuments(deviceID, value) async {
    if (value != null) {
      firestore.collection('$deviceID').doc().set({'item': value});
      Trigger().toggleFade();
    }
  }

  deleteItemFromDocuments(deviceID, id) async {
    if (id != null) {
      firestore.collection('$deviceID').doc(id).delete();
    }
  }
}

class Trigger extends ChangeNotifier {
  bool fade = false;

  toggleFade() {
    fade = true;
    notifyListeners();
  }
}
