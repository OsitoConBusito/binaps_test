// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:binaps_test/ui/views/list/pokemon_list_view.dart' as _i2;
import 'package:binaps_test/ui/views/pokemon_detail/pokemon_detail_view.dart'
    as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i5;

class Routes {
  static const pokemonListView = '/pokemon-list-view';

  static const pokemonDetailView = '/pokemon-detail-view';

  static const all = <String>{
    pokemonListView,
    pokemonDetailView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.pokemonListView,
      page: _i2.PokemonListView,
    ),
    _i1.RouteDef(
      Routes.pokemonDetailView,
      page: _i3.PokemonDetailView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.PokemonListView: (data) {
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.PokemonListView(),
        settings: data,
      );
    },
    _i3.PokemonDetailView: (data) {
      final args = data.getArgs<PokemonDetailViewArguments>(nullOk: false);
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i3.PokemonDetailView(key: args.key, pokemonId: args.pokemonId),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class PokemonDetailViewArguments {
  const PokemonDetailViewArguments({
    this.key,
    required this.pokemonId,
  });

  final _i4.Key? key;

  final int pokemonId;

  @override
  String toString() {
    return '{"key": "$key", "pokemonId": "$pokemonId"}';
  }

  @override
  bool operator ==(covariant PokemonDetailViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.pokemonId == pokemonId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ pokemonId.hashCode;
  }
}

extension NavigatorStateExtension on _i5.NavigationService {
  Future<dynamic> navigateToPokemonListView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.pokemonListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPokemonDetailView({
    _i4.Key? key,
    required int pokemonId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.pokemonDetailView,
        arguments: PokemonDetailViewArguments(key: key, pokemonId: pokemonId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPokemonListView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.pokemonListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPokemonDetailView({
    _i4.Key? key,
    required int pokemonId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.pokemonDetailView,
        arguments: PokemonDetailViewArguments(key: key, pokemonId: pokemonId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
