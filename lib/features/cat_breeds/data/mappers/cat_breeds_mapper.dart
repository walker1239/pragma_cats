import 'package:pragma_cats/features/cat_breeds/data/models/responses/cat_breeds_response.dart';
import 'package:pragma_cats/features/cat_breeds/domain/entities/cat_breeds_entity.dart';
import 'package:pragma_cats/features/cat_breeds/domain/entities/weight_entity.dart';

extension CatBreedsResponseMapper on CatBreedsResponse {
  List<CatBreedEntity> toDomainList() {
    return catBreeds?.map((breed) => breed.toDomain()).toList() ?? [];
  }
}

extension CatBreedModelMapper on BreedsResponse {
  CatBreedEntity toDomain() {
    return CatBreedEntity(
      id: id ?? '',
      name: name ?? '',
      description: description ?? '',
      origin: origin ?? '',
      temperament: temperament ?? '',
      lifeSpan: lifeSpan ?? '',
      weight: weight?.toDomain() ?? WeightEntity(imperial: '', metric: ''),
      adaptability: adaptability ?? 0,
      affectionLevel: affectionLevel ?? 0,
      childFriendly: childFriendly ?? 0,
      dogFriendly: dogFriendly ?? 0,
      energyLevel: energyLevel ?? 0,
      grooming: grooming ?? 0,
      healthIssues: healthIssues ?? 0,
      intelligence: intelligence ?? 0,
      sheddingLevel: sheddingLevel ?? 0,
      socialNeeds: socialNeeds ?? 0,
      strangerFriendly: strangerFriendly ?? 0,
      vocalisation: vocalisation ?? 0,
      indoor: indoor == 1,
      lap: lap == 1,
      hypoallergenic: hypoallergenic == 1,
      imageUrl: imageUrl ?? '',
    );
  }
}

extension WeightModelMapper on WeightResponse {
  WeightEntity toDomain() {
    return WeightEntity(
      imperial: imperial ?? '',
      metric: metric ?? '',
    );
  }
}
