import 'package:dartz/dartz.dart';
import 'package:pragma_cats/core/error/failure.dart';
import 'package:pragma_cats/core/usecase/usecase.dart';
import 'package:pragma_cats/features/cat_breeds/domain/entities/cat_breeds_entity.dart';
import 'package:pragma_cats/features/cat_breeds/domain/repositories/cat_breeds_repository.dart';

class GetCatBreedsUseCase implements UseCase<List<CatBreedEntity>, NoParams> {
  final CatBreedsRepository repository;

  GetCatBreedsUseCase(this.repository);

  @override
  Future<Either<Failure, List<CatBreedEntity>>> call(NoParams params) async {
    return await repository.getData();
  }
}
