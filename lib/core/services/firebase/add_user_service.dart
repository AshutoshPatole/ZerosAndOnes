import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    await database.collection("users").doc(_user!.uid).collection("cart").add({
      "itemId": itemId,
      "price": price,
      "itemPhoto": itemPhoto,
      "quantity": quantity,
    });
  }
}
