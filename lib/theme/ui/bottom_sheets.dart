import 'package:stacked_services/stacked_services.dart';

import '../../core/constants/bottom_sheet_enum.dart';
import '../../core/locator.dart';
import '../../widgets/dumb_widgets/custom_bottom_sheet.dart';
import '../../widgets/smart_widgets/otp_bottom_sheet/otp_screen.dart';

void setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();

  final builders = {
    BottomSheetType.floating: (context, sheetRequest, completer) =>
        FloatingBoxBottomSheet(request: sheetRequest, completer: completer),
    BottomSheetType.otp: (context, sheetRequest, completer) =>
        FloatingOTPSheet(request: sheetRequest, completer: completer)
  };

  bottomSheetService.setCustomSheetBuilders(builders);
}
