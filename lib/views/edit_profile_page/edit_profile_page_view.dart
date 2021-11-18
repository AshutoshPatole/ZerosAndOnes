import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'edit_profile_page_view_model.dart';

class EditProfilePageView extends StatelessWidget {
  const EditProfilePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditProfilePageViewModel>.reactive(
      builder: (BuildContext context, EditProfilePageViewModel viewModel, _) {
        return Scaffold(
          body: Center(
            child: Text('EditProfilePage View'),
          ),
        );
      },
      viewModelBuilder: () => EditProfilePageViewModel(),
    );
  }
}
