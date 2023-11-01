import 'dart:convert';

import 'package:binaps_test/data/dto/get_pokemon_detail_response_dto.dart';
import 'package:binaps_test/data/dto/get_pokemon_response_dto.dart';
import 'package:http/http.dart';

class ApiService {
  Future<List<Pokemon>> getPokemon(int offset) async {
    final response = await get(
      Uri.https(
        'pokeapi.co',
        '/api/v2/pokemon/',
        {
          'limit': '30',
          'offset': '$offset',
        },
      ),
    );
    if (response.statusCode < 400) {
      final responseBodyAsMap =
          jsonDecode(response.body) as Map<String, dynamic>;
      final getPokemonResponseDto =
          GetPokemonResponseDto.fromJson(responseBodyAsMap);
      return getPokemonResponseDto.results;
    }

    throw Exception('Response Code: ${response.statusCode} - ${response.body}');
  }

  Future<GetPokemonDetailResponseDto> getPokemonDetail(int id) async {
    final response = await get(
      Uri.https(
        'pokeapi.co',
        '/api/v2/pokemon/$id',
      ),
    );
    if (response.statusCode < 400) {
      final responseBodyAsMap =
          jsonDecode(response.body) as Map<String, dynamic>;
      final getPokemonResponseDto =
          GetPokemonDetailResponseDto.fromJson(responseBodyAsMap);
      return getPokemonResponseDto;
    }

    throw Exception('Response Code: ${response.statusCode} - ${response.body}');
  }
}
