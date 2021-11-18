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
                  ProfileRow(
                      itemName: "Phone Number",
                      itemData: viewModel.user.phoneNumber ?? "N/A"),
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
