import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:stacked/stacked.dart';

import 'login_page_view_model.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginPageViewModel>.reactive(
      builder: (BuildContext context, LoginPageViewModel viewModel, _) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SignInButton(
                  Buttons.Google,
                  padding: const EdgeInsets.all(12.0),
                  onPressed: () {
                    viewModel.signInWithGoogle();
                  },
                ),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => LoginPageViewModel(),
    );
  }
}
