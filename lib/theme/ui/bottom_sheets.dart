import 'package:stacked_services/stacked_services.dart';
import 'package:zerosandones/core/constants/bottom_sheet_enum.dart';
import 'package:zerosandones/core/locator.dart';
import 'package:zerosandones/widgets/dumb_widgets/custom_bottom_sheet.dart';

void setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();

  final builders = {
    BottomSheetType.floating: (context, sheetRequest, completer) =>
        FloatingBoxBottomSheet(request: sheetRequest, completer: completer)
  };

  bottomSheetService.setCustomSheetBuilders(builders);
}
