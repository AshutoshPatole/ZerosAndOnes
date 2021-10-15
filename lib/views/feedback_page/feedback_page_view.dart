import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'feedback_page_view_model.dart';

class FeedbackPageView extends StatelessWidget {
  const FeedbackPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FeedbackPageViewModel>.reactive(
      builder: (BuildContext context, FeedbackPageViewModel viewModel, _) {
        return Scaffold(
          body: Center(
            child: Text('FeedbackPage View'),
          ),
        );
      },
      viewModelBuilder: () => FeedbackPageViewModel(),
    );
  }
}
