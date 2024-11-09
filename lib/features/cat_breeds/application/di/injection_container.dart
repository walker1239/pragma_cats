import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:pragma_cats/features/cat_breeds/data/datasources/cat_breeds_remote_datasource.dart';
import 'package:pragma_cats/features/cat_breeds/data/repositories/cat_breeds_repository_impl.dart';
import 'package:pragma_cats/features/cat_breeds/domain/repositories/cat_breeds_repository.dart';
import 'package:pragma_cats/features/cat_breeds/domain/usecases/get_cat_breeds_usecase.dart';

Future<void> initCatBreedsDependencies() async {
  GetIt.I.registerLazySingleton<CatBreedsRemoteDatasource>(
    () => CatBreedsRemoteDatasourceImpl(client: GetIt.I<http.Client>()),
  );

  GetIt.I.registerLazySingleton<CatBreedsRepository>(
    () => CatBreedsRepositoryImpl(
      remoteDataSource: GetIt.I<CatBreedsRemoteDatasource>(),
    ),
  );

  GetIt.I.registerLazySingleton<GetCatBreedsUseCase>(
      () => GetCatBreedsUseCase(GetIt.I<CatBreedsRepository>()));
}
