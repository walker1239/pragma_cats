abstract class CatBreedsEvent {}

class LoadCatBreeds extends CatBreedsEvent {}

class SearchCatBreeds extends CatBreedsEvent {
  final String query;

  SearchCatBreeds(this.query);

  List<Object> get props => [query];
}
