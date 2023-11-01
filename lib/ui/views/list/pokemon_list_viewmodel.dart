import 'package:binaps_test/app/app.router.dart';
import 'package:binaps_test/data/dto/get_pokemon_response_dto.dart';
import 'package:binaps_test/services/api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

const pokemonBusyKey = 'pokemons';

class PokemonListViewModel extends BaseViewModel {
  final apiService = locator<ApiService>();
  final _navigationService = locator<NavigationService>();

  int offset = 0;

  bool _hasMore = true;

  bool get hasMore => _hasMore;

  final List<Pokemon> _pokemonList = [];

  List<Pokemon> get pokemonList => _pokemonList;

  void setup() async {
    await getPokemons();
  }

  Future<void> getPokemons() async {
    await apiService.getPokemon(offset).then(
      (List<Pokemon>? fetchedPokemonList) {
        if (fetchedPokemonList!.isEmpty) {
          _hasMore = false;
          setBusyForObject(pokemonBusyKey, false);
        } else {
          offset += 30;
          _pokemonList.addAll(fetchedPokemonList);
          setBusyForObject(pokemonBusyKey, false);
        }
      },
    );
  }

  Future<void> navigateToDetailView(int id) async {
    _navigationService.navigateToPokemonDetailView(pokemonId: id);
  }
}
