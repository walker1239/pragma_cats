// ignore: one_member_abstracts
import 'package:dartz/dartz.dart';
import 'package:pragma_cats/core/error/failure.dart';
import 'package:pragma_cats/features/cat_breeds/domain/entities/cat_breeds_entity.dart';

abstract class CatBreedsRepository {
  Future<Either<Failure, List<CatBreedEntity>>> getData();
}
