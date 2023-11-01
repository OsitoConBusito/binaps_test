import 'package:binaps_test/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/ui_helpers.dart';
import 'pokemon_list_viewmodel.dart';

class PokemonListView extends StatelessWidget {
  const PokemonListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PokemonListViewModel>.reactive(
      viewModelBuilder: () => PokemonListViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => verticalSpaceSmall,
              itemBuilder: (context, index) {
                final generatedColor = randomColor();

                if (index >= viewModel.pokemonList.length) {
                  if (!viewModel.busy(pokemonBusyKey)) {
                    viewModel.getPokemons();
                  }
                  return const Center(
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                final name =
                    viewModel.pokemonList[index].name.capitalize as String;
                return InkWell(
                  onTap: () {
                    viewModel.navigateToDetailView(index + 1);
                  },
                  child: Card(
                    color: generatedColor,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Text(
                            '${index + 1}'.padLeft(3, '0'),
                          ),
                          horizontalSpaceSmall,
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Text(
                              name.substring(0, 2).toUpperCase(),
                              style: TextStyle(
                                color: generatedColor,
                              ),
                            ),
                          ),
                          horizontalSpaceMedium,
                          Text(
                            name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.keyboard_double_arrow_right_outlined,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: viewModel.hasMore
                  ? viewModel.pokemonList.length + 1
                  : viewModel.pokemonList.length,
            ),
          ),
        ),
      ),
    );
  }
}
