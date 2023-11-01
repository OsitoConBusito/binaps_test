class GetPokemonResponseDto {
  final int count;
  final String next;
  final dynamic previous;
  final List<Pokemon> results;

  GetPokemonResponseDto({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory GetPokemonResponseDto.fromJson(Map<String, dynamic> json) =>
      GetPokemonResponseDto(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Pokemon>.from(json["results"].map((x) => Pokemon.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Pokemon {
  final String name;
  final String url;

  Pokemon({
    required this.name,
    required this.url,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
