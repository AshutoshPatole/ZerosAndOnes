import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserService {
  FirebaseFirestore database = FirebaseFirestore.instance;
  final User? _user = FirebaseAuth.instance.currentUser;

  sampleAddingData() async {
    // await database.collection("/users").doc(_auth.currentUser?.uid).set(
    //   {
    //     "name": _auth.currentUser?.displayName,
    //     "phoneNumber": _auth.currentUser?.phoneNumber,
    //     "email": _auth.currentUser?.email,
    //   },
    // );
  }

  addItemToCart({
    required String itemId,
    required String price,
    required String itemPhoto,
    required String quantity,
  }) async {
    if (_user?.uid != null) {
      CollectionReference collectionReference =
          database.collection("users").doc(_user?.uid).collection("cart");
      String docId = collectionReference.doc().id;
      await collectionReference.doc(docId).set({
        "itemId": itemId,
        "price": price,
        "itemPhoto": itemPhoto,
        "quantity": quantity,
        "id": docId,
      });
    } else {
      Fluttertoast.showToast(
        msg: "You need to sign in first.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red.shade600,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}
