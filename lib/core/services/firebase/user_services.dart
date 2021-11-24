import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:zerosandones/core/logger.dart';

class UserService {
  Logger log = getLogger("UserService");
  FirebaseFirestore database = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  sampleAddingData() async {
    // await database.collection("/users").doc(_auth.currentUser?.uid).set(
    //   {
    //     "name": _auth.currentUser?.displayName,
    //     "phoneNumber": _auth.currentUser?.phoneNumber,
    //     "email": _auth.currentUser?.email,
    //   },
    // );
  }

  Future<bool> addItemToCart(
      {required String itemId,
      required String price,
      required String itemPhoto,
      required String quantity,
      required String itemName}) async {
    try {
      if (_auth.currentUser?.uid != null) {
        var existsDoc = await database
            .collection("users/${_auth.currentUser?.uid}/cart")
            .where(
              'itemId',
              isEqualTo: itemId,
            )
            .get();
        if (existsDoc.docs[0].exists) {
          var docId = existsDoc.docs[0].reference.id;
          CollectionReference updateRef = database
              .collection("users")
              .doc(_auth.currentUser?.uid)
              .collection("cart");
          // await updateRef.doc(docId).update({
          //   'quantity':  // ! TODO Incomplete
          // });
        } else {
          CollectionReference addRef = database
              .collection("users")
              .doc(_auth.currentUser?.uid)
              .collection("cart");
          String docId = addRef.doc().id;
          await addRef.doc(docId).set({
            "itemId": itemId,
            "price": price,
            "itemPhoto": itemPhoto,
            "quantity": quantity,
            "id": docId,
            "itemName": itemName,
          });
          return true;
        }
      } else {
        log.e("could not add product $itemId - $price");
        return false;
      }
    } catch (e) {
      log.e(e.toString());
      return false;
    }
  }
}
