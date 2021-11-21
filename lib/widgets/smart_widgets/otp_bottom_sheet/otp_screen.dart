import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

import 'package:stacked_services/stacked_services.dart';
import '../../../theme/app_theme.dart';
import 'otp_view_model.dart';

class FloatingOTPSheet extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;

  FloatingOTPSheet({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final String? phoneNumber = '';

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: AppTheme.primaryColor),
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.white,
      boxShadow: [
        const BoxShadow(
          offset: Offset(-4, -4),
          color: Colors.white,
          blurRadius: 2,
          spreadRadius: 5,
        ),
        BoxShadow(
          offset: const Offset(2, 4),
          color: Colors.blueGrey.shade200,
          blurRadius: 10,
          spreadRadius: 1,
        ),
      ],
    );
  }

  final _model = OtpViewModel();
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: _size.height * 0.085,
          ),
          PinPut(
            fieldsCount: 6,
            onSubmit: (String pin) {
              _model.verifyCode(request.data, pin);
            },
            focusNode: _pinPutFocusNode,
            controller: _pinPutController,
            submittedFieldDecoration: _pinPutDecoration.copyWith(
              borderRadius: BorderRadius.circular(10.0),
            ),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            pinAnimationType: PinAnimationType.scale,
            selectedFieldDecoration: _pinPutDecoration,
            followingFieldDecoration: _pinPutDecoration.copyWith(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                color: AppTheme.primaryColor.withOpacity(.5),
              ),
            ),
          ),
          SizedBox(
            height: _size.height * 0.05,
          ),
          const Align(
            child: Text(
              "Code not recieved ?",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: _size.height * 0.02,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => completer(SheetResponse(confirmed: true)),
                child: Text(
                  request.secondaryButtonTitle!,
                ),
              ),
            ],
          ),
          SizedBox(
            height: _size.height * 0.02,
          ),
        ],
      ),
    );
  }
}
