import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'login_page_view_model.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();

  String initialCountry = 'IN';

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return ViewModelBuilder<LoginPageViewModel>.reactive(
      builder: (BuildContext context, LoginPageViewModel viewModel, _) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InternationalPhoneNumberInput(
                    onInputChanged: (PhoneNumber number) {},
                    selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    ),
                    ignoreBlank: false,
                    autoValidateMode: AutovalidateMode.disabled,
                    selectorTextStyle: const TextStyle(color: Colors.black),
                    initialValue: viewModel.number,
                    textFieldController: controller,
                    formatInput: false,
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    inputBorder: const OutlineInputBorder(),
                  ),
                  SizedBox(
                    height: _size.height * 0.1,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      formKey.currentState!.validate();
                      formKey.currentState!.save();
                    },
                    child: const Text('Next'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => LoginPageViewModel(),
    );
  }
}
