import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:pragma_cats/core/error/failure.dart';
import 'package:pragma_cats/core/usecase/usecase.dart';
import 'package:pragma_cats/features/cat_breeds/domain/entities/cat_breeds_entity.dart';
import 'package:pragma_cats/features/cat_breeds/domain/usecases/get_cat_breeds_usecase.dart';
import 'package:pragma_cats/features/cat_breeds/presentation/bloc/cat_breeds_event.dart';
import 'package:pragma_cats/features/cat_breeds/presentation/bloc/cat_breeds_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatBreedsBloc extends Bloc<CatBreedsEvent, CatBreedsState> {
  final GetCatBreedsUseCase getCatBreedsUseCase;

  CatBreedsBloc(this.getCatBreedsUseCase) : super(const CatBreedsState()) {
    on<LoadCatBreeds>(_onLoadCatBreeds);
    on<SearchCatBreeds>(_onSearchCatBreeds);
  }

  List<CatBreedEntity> _allCatBreeds = [];

  Future<void> _onLoadCatBreeds(
      LoadCatBreeds event, Emitter<CatBreedsState> emit) async {
    emit(state.copyWith(idle: false, pending: true, error: null));

    final Either<Failure, List<CatBreedEntity>> result =
        await getCatBreedsUseCase(NoParams());

    result.fold(
      (failure) {
        emit(state.copyWith(
          idle: false,
          pending: false,
          error: Exception('Failed to load cat breeds'),
        ));
      },
      (catBreeds) {
        emit(state.copyWith(
          idle: false,
          pending: false,
          error: null,
          catBreeds: catBreeds,
        ));
        _allCatBreeds = catBreeds;
      },
    );
  }

  void _onSearchCatBreeds(
    SearchCatBreeds event,
    Emitter<CatBreedsState> emit,
  ) {
    final filteredBreeds = event.query.isEmpty
        ? _allCatBreeds
        : _allCatBreeds
            .where((breed) =>
                breed.name.toLowerCase().contains(event.query.toLowerCase()))
            .toList();
    log(_allCatBreeds.toString());
    log(filteredBreeds.toString());
    emit(state.copyWith(catBreeds: filteredBreeds));
  }
}
