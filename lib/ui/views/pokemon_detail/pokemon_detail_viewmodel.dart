import 'package:binaps_test/data/dto/get_pokemon_detail_response_dto.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../services/api_service.dart';

class PokemonDetailViewModel
    extends FutureViewModel<GetPokemonDetailResponseDto> {
  PokemonDetailViewModel(this.pokemonId);

  final apiService = locator<ApiService>();

  final int pokemonId;

  @override
  Future<GetPokemonDetailResponseDto> futureToRun() {
    return apiService.getPokemonDetail(pokemonId);
  }
}
