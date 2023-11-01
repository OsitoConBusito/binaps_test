import 'package:binaps_test/ui/views/list/pokemon_list_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:binaps_test/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  PokemonListViewModel getModel() => PokemonListViewModel();

  group('HomeViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
