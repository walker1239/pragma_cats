import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

Future<void> initCoreDependencies() async {
  GetIt.I.registerLazySingleton(() => http.Client());
}
