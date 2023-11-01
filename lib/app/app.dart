import 'package:binaps_test/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:binaps_test/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:binaps_test/ui/views/list/pokemon_list_view.dart';
import 'package:binaps_test/services/api_service.dart';
import 'package:binaps_test/ui/views/pokemon_detail/pokemon_detail_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: PokemonListView),
    MaterialRoute(page: PokemonDetailView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
