import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pragma_cats/features/cat_breeds/presentation/bloc/cat_breeds_bloc.dart';
import 'package:pragma_cats/features/cat_breeds/presentation/bloc/cat_breeds_event.dart';
import 'package:pragma_cats/features/cat_breeds/presentation/bloc/cat_breeds_state.dart';
import 'package:pragma_cats/features/cat_breeds/presentation/views/cat_breeds_detail_view.dart';

class CatBreedsView extends StatelessWidget {
  const CatBreedsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Breeds'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              onChanged: (query) {
                log(query);
                context.read<CatBreedsBloc>().add(SearchCatBreeds(query));
              },
              decoration: const InputDecoration(
                hintText: 'Buscar por nombre de raza',
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<CatBreedsBloc, CatBreedsState>(
        builder: (context, state) {
          if (state.pending) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.error != null) {
            return Center(child: Text(state.error.toString()));
          } else if (state.catBreeds.isNotEmpty) {
            return ListView.builder(
              itemCount: state.catBreeds.length,
              itemBuilder: (context, index) {
                final breed = state.catBreeds[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CatBreedDetailPage(breed: breed),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            breed.name,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 14),
                            child: Image.network(
                              breed.imageUrl ?? '',
                              height: 300,
                              width: double.infinity,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Origen: ${breed.origin}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                'Inteligencia: ${breed.intelligence}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: Text('No hay gatos para mostrar'));
        },
      ),
    );
  }
}
