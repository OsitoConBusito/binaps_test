import 'package:binaps_test/ui/common/ui_helpers.dart';
import 'package:binaps_test/ui/views/pokemon_detail/pokemon_detail_viewmodel.dart';
import 'package:binaps_test/ui/views/pokemon_detail/widgets/image_widget.dart';
import 'package:binaps_test/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PokemonDetailView extends StatefulWidget {
  const PokemonDetailView({super.key, required this.pokemonId});

  final int pokemonId;

  @override
  State<PokemonDetailView> createState() => _PokemonDetailViewState();
}

class _PokemonDetailViewState extends State<PokemonDetailView> {
  int currentImage = 0;
  Color selectedColor = randomColor();

  @override
  Widget build(BuildContext context) {
    final imageSize = MediaQuery.sizeOf(context).width * 0.6;
    return ViewModelBuilder<PokemonDetailViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                randomColor(),
                randomColor(),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0, 0.5],
            ),
          ),
          child: model.isBusy
              ? const Center(child: CircularProgressIndicator())
              : Builder(
                  builder: (context) {
                    final List<String> images = [
                      model.data!.sprites!.frontDefault,
                      model.data!.sprites!.frontFemale,
                      model.data!.sprites!.frontShiny,
                      model.data!.sprites!.frontShinyFemale,
                      model.data!.sprites!.backDefault,
                      model.data!.sprites!.backFemale,
                      model.data!.sprites!.backShiny,
                      model.data!.sprites!.backShinyFemale,
                    ]
                        .where((element) => element != null)
                        .map((e) => e!)
                        .toList();
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          verticalSpaceLarge,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  currentImage--;
                                  if (currentImage < 0) {
                                    currentImage = images.length - 1;
                                  }
                                  setState(() {});
                                },
                                icon: const Icon(
                                  Icons.arrow_left,
                                  size: 32,
                                ),
                              ),
                              FloatingImage(
                                imageUrl: images[currentImage],
                                imageSize: imageSize,
                                color: selectedColor,
                              ),
                              IconButton(
                                onPressed: () {
                                  currentImage++;
                                  if (currentImage == images.length) {
                                    currentImage = 0;
                                  }
                                  setState(() {});
                                },
                                icon: const Icon(
                                  Icons.arrow_right,
                                  size: 32,
                                ),
                              ),
                            ],
                          ),
                          verticalSpaceLarge,
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                    color: randomColor(),
                                  ),
                                  child: Text(
                                    '${model.data?.id ?? ''}'.padLeft(3, '0'),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                                horizontalSpaceMedium,
                                const Icon(
                                  Icons.keyboard_double_arrow_right_sharp,
                                ),
                                horizontalSpaceMedium,
                                Text(
                                  model.data!.name!.capitalize,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          verticalSpaceMedium,
                          Card(
                            color: selectedColor,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Status:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  verticalSpaceSmall,
                                  Text(
                                    'Altura: ${model.data!.height}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  verticalSpaceSmall,
                                  Text(
                                    'Peso: ${model.data!.weight}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  verticalSpaceSmall,
                                  SizedBox(
                                    height: 40,
                                    child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: model.data!.types!.length,
                                      itemBuilder: (context, index) =>
                                          Container(
                                        margin:
                                            const EdgeInsets.only(right: 16),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 24,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          color: randomColor(),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(50),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            model
                                                .data!.types![index].type!.name!
                                                .toUpperCase(),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          verticalSpaceMedium,
                          Card(
                            color: selectedColor,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Movimientos: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  verticalSpaceSmall,
                                  ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    itemCount: model.data!.moves!.length > 4
                                        ? 4
                                        : model.data!.moves!.length,
                                    itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Row(
                                        children: [
                                          Text(
                                            '${index + 1}.',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          horizontalSpaceSmall,
                                          Text(
                                            model.data!.moves![index].move!
                                                .name!.capitalize,
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ),
      viewModelBuilder: () => PokemonDetailViewModel(widget.pokemonId),
    );
  }
}
