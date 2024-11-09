import 'package:equatable/equatable.dart';
import 'package:pragma_cats/features/cat_breeds/domain/entities/cat_breeds_entity.dart';

class CatBreedsState extends Equatable {
  const CatBreedsState({
    this.idle = true,
    this.pending = false,
    this.error,
    this.catBreeds = const [],
  });

  final bool idle;
  final bool pending;
  final Exception? error;
  final List<CatBreedEntity> catBreeds;

  CatBreedsState copyWith({
    bool? idle,
    bool? pending,
    Exception? error,
    List<CatBreedEntity>? catBreeds,
  }) {
    return CatBreedsState(
      idle: idle ?? this.idle,
      pending: pending ?? this.pending,
      error: error ?? this.error,
      catBreeds: catBreeds ?? this.catBreeds,
    );
  }

  @override
  List<Object?> get props => [idle, pending, error, catBreeds];
}
