import 'package:dartz/dartz.dart';
import 'package:pragma_cats/core/error/failure.dart';
import 'package:pragma_cats/features/cat_breeds/data/datasources/cat_breeds_remote_datasource.dart';
import 'package:pragma_cats/features/cat_breeds/data/mappers/cat_breeds_mapper.dart';
import 'package:pragma_cats/features/cat_breeds/domain/entities/cat_breeds_entity.dart';
import 'package:pragma_cats/features/cat_breeds/domain/repositories/cat_breeds_repository.dart';

class CatBreedsRepositoryImpl implements CatBreedsRepository {
  CatBreedsRepositoryImpl({required this.remoteDataSource});

  final CatBreedsRemoteDatasource remoteDataSource;

  @override
  Future<Either<Failure, List<CatBreedEntity>>> getData() async {
    try {
      final response = await remoteDataSource.getData();
      return Right(response.toDomainList());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
