import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:zerosandones/core/logger.dart';

class CartService {
  Logger log = getLogger("UserService");
  FirebaseFirestore database = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<bool> addItemToCart(
      {required String itemId,
      required String price,
      required String itemPhoto,
      required int quantity,
      required String itemName}) async {
    try {
      // check if user is logged in
      if (_auth.currentUser?.uid != null) {
        // check if user has the item in cart already.
        bool exists = await checkIfItemIsPresentInCart(itemId: itemId);

        if (exists) {
          // if the item is present then increment the quantity to +1
          bool updated = await itemQuantity(itemId: itemId, increment: true);
          return updated;
        } else {
          // if the item is not present then add the item to the users cart.
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

  Future<bool> itemQuantity(
      {required String itemId, required bool increment}) async {
    // fetch the item details if present
    var existsDoc = await database
        .collection("users/${_auth.currentUser?.uid}/cart")
        .where(
          'itemId',
          isEqualTo: itemId,
        )
        .limit(1)
        .get();
    // check if it exists
    if (existsDoc.docs.isNotEmpty && existsDoc.docs[0].exists) {
      var docId = existsDoc.docs[0].reference.id;
      CollectionReference updateRef = database
          .collection("users")
          .doc(_auth.currentUser?.uid)
          .collection("cart");

      // based on increment parameter choose whether to increment or decrement the value
      if (increment) {
        await updateRef.doc(docId).update({
          'quantity': FieldValue.increment(1),
        });
        return true;
      } else {
        var quan = existsDoc.docs[0].data();
        var quantity = quan['quantity'];
        // Assure that the quantity value does not go less than 1.
        if (quantity <= 1) {
          return false;
        }
        await updateRef.doc(docId).update({
          'quantity': FieldValue.increment(-1),
        });
        return true;
      }
    } else {
      return false;
    }
  }

  Future<bool> checkIfItemIsPresentInCart({
    required String itemId,
  }) async {
    var doc = await database
        .collection("users/${_auth.currentUser?.uid}/cart")
        .where('itemId', isEqualTo: itemId)
        .limit(1)
        .get();
    if (doc.docs.isNotEmpty && doc.docs[0].exists) {
      return true;
    } else {
      return false;
    }
  }
}
