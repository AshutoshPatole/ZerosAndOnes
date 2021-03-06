import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zerosandones/core/locator.dart';
import 'package:zerosandones/core/models/cart_items.dart';
import 'package:zerosandones/core/services/firebase/user_services.dart';

import '../../core/logger.dart';

class CartPageViewModel extends BaseViewModel {
  late Logger log;

  CartPageViewModel() {
    log = getLogger(runtimeType.toString());
  }
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final User? _user = FirebaseAuth.instance.currentUser;
  final _userService = locator<CartService>();
  final _navigationService = locator<NavigationService>();

  incOrDec({required String itemId, bool increment = true}) {
    _userService.itemQuantity(itemId: itemId, increment: increment);
  }

  navigateBack() {
    _navigationService.back();
  }

  Stream<List<CartItem>> getCartItems() {
    var items =
        _db.collection("users").doc(_user?.uid).collection("cart").snapshots();
    return items.map(
      (event) => event.docs.map((doc) {
        return CartItem.fromJson(doc.data());
      }).toList(),
    );
  }
}
