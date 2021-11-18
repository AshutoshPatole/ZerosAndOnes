import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:stacked/stacked.dart';
import 'phone_auth_page_view_model.dart';

class PhoneAuthPageView extends StatefulWidget {
  const PhoneAuthPageView({Key? key}) : super(key: key);

  @override
  State<PhoneAuthPageView> createState() => _PhoneAuthPageViewState();
}

class _PhoneAuthPageViewState extends State<PhoneAuthPageView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();

  String initialCountry = 'IN';
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return ViewModelBuilder<PhoneAuthPageViewModel>.reactive(
      builder: (BuildContext context, PhoneAuthPageViewModel viewModel, _) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        viewModel.setNumber(number);
                      },
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      ),
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: const TextStyle(color: Colors.black),
                      initialValue: viewModel.initialCountry,
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
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          // print(controller.text); 9d22f78c21e1aea0bb895ab0768f351095684454
                          viewModel.signInWithPhone();
                        }
                      },
                      child: const Text('Next'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => PhoneAuthPageViewModel(),
    );
  }
}
