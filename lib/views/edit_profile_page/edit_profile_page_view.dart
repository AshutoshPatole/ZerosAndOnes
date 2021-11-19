import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zerosandones/theme/app_theme.dart';
import 'package:zerosandones/widgets/dumb_widgets/profile_row.dart';
import 'edit_profile_page_view_model.dart';

class EditProfilePageView extends StatelessWidget {
  const EditProfilePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return ViewModelBuilder<EditProfilePageViewModel>.reactive(
      builder: (BuildContext context, EditProfilePageViewModel viewModel, _) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Profile",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                  SizedBox(
                    height: _size.height * 0.05,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Hero(
                      tag: "photoURL",
                      child: Container(
                        height: _size.height * 0.2,
                        width: _size.width * 0.35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: AppTheme.grey.withOpacity(0.6),
                                offset: const Offset(2.0, 4.0),
                                blurRadius: 8),
                          ],
                        ),
                        child: CircleAvatar(
                          foregroundImage:
                              NetworkImage("${viewModel.user.photoURL}"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _size.height * 0.05,
                  ),
                  ProfileRow(
                      itemName: "Name", itemData: viewModel.user.displayName!),
                  ProfileRow(
                      itemName: "Email", itemData: viewModel.user.email!),
                  Stack(
                    children: [
                      ProfileRow(
                          itemName: "Phone Number",
                          itemData: viewModel.user.phoneNumber ?? "N/A"),
                      Positioned(
                        left: _size.width * 0.31,
                        bottom: 8,
                        child: GestureDetector(
                          onTap: () {
                            viewModel.navigateToPhoneAuthenticationPage();
                          },
                          child: const Icon(
                            CupertinoIcons.pencil_circle,
                            size: 20,
                            color: AppTheme.primaryColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: _size.height * 0.1,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      child: const Text(
                        "Delete Account",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () {
                        // ON HOLD
                        // TODO: Implement delete account firebase extension
                      },
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      viewModel.user.uid,
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _size.height * 0.02,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "App Version 0.0.1",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _size.height * 0.02,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => EditProfilePageViewModel(),
    );
  }
}
