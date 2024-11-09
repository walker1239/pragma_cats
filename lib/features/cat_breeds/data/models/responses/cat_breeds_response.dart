class CatBreedsResponse {
  final List<BreedsResponse>? catBreeds;

  CatBreedsResponse({this.catBreeds});

  factory CatBreedsResponse.fromJson(List<dynamic> json) {
    return CatBreedsResponse(
      catBreeds: json.map((e) => BreedsResponse.fromJson(e)).toList(),
    );
  }
}

class BreedsResponse {
  final String? id;
  final String? name;
  final String? description;
  final String? origin;
  final String? temperament;
  final String? lifeSpan;
  final WeightResponse? weight;
  final int? adaptability;
  final int? affectionLevel;
  final int? childFriendly;
  final int? dogFriendly;
  final int? energyLevel;
  final int? grooming;
  final int? healthIssues;
  final int? intelligence;
  final int? sheddingLevel;
  final int? socialNeeds;
  final int? strangerFriendly;
  final int? vocalisation;
  final int? indoor;
  final int? lap;
  final int? hypoallergenic;
  final String? imageUrl;

  BreedsResponse({
    this.id,
    this.name,
    this.description,
    this.origin,
    this.temperament,
    this.lifeSpan,
    this.weight,
    this.adaptability,
    this.affectionLevel,
    this.childFriendly,
    this.dogFriendly,
    this.energyLevel,
    this.grooming,
    this.healthIssues,
    this.intelligence,
    this.sheddingLevel,
    this.socialNeeds,
    this.strangerFriendly,
    this.vocalisation,
    this.indoor,
    this.lap,
    this.hypoallergenic,
    this.imageUrl,
  });

  factory BreedsResponse.fromJson(Map<String, dynamic> json) {
    return BreedsResponse(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      origin: json['origin'],
      temperament: json['temperament'],
      lifeSpan: json['life_span'],
      weight: WeightResponse.fromJson(json['weight']),
      adaptability: json['adaptability'],
      affectionLevel: json['affection_level'],
      childFriendly: json['child_friendly'],
      dogFriendly: json['dog_friendly'],
      energyLevel: json['energy_level'],
      grooming: json['grooming'],
      healthIssues: json['health_issues'],
      intelligence: json['intelligence'],
      sheddingLevel: json['shedding_level'],
      socialNeeds: json['social_needs'],
      strangerFriendly: json['stranger_friendly'],
      vocalisation: json['vocalisation'],
      indoor: json['indoor'],
      lap: json['lap'],
      hypoallergenic: json['hypoallergenic'],
      imageUrl: json['reference_image_id'] != null
          ? 'https://cdn2.thecatapi.com/images/${json['reference_image_id']}.jpg'
          : null,
    );
  }
}

class WeightResponse {
  final String? imperial;
  final String? metric;

  WeightResponse({this.imperial, this.metric});

  factory WeightResponse.fromJson(Map<String, dynamic> json) {
    return WeightResponse(
      imperial: json['imperial'],
      metric: json['metric'],
    );
  }
}
