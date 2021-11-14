import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'core/locator.dart';
import 'core/router_constants.dart';
import 'core/router.dart' as router;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocatorInjector.setUpLocator();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: router.Router.generateRoute,
      initialRoute: navigationViewRoute,
    );
  }
}
