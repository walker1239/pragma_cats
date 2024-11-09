import 'package:pragma_cats/features/cat_breeds/domain/entities/weight_entity.dart';

class CatBreedEntity {
  final String id;
  final String name;
  final String description;
  final String origin;
  final String temperament;
  final String lifeSpan;
  final WeightEntity weight;
  final int adaptability;
  final int affectionLevel;
  final int childFriendly;
  final int dogFriendly;
  final int energyLevel;
  final int grooming;
  final int healthIssues;
  final int intelligence;
  final int sheddingLevel;
  final int socialNeeds;
  final int strangerFriendly;
  final int vocalisation;
  final bool indoor;
  final bool lap;
  final bool hypoallergenic;
  final String? imageUrl;

  CatBreedEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.origin,
    required this.temperament,
    required this.lifeSpan,
    required this.weight,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    required this.indoor,
    required this.lap,
    required this.hypoallergenic,
    this.imageUrl,
  });
}
