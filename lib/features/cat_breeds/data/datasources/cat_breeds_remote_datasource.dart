import 'dart:developer';

import 'package:pragma_cats/features/cat_breeds/data/models/responses/cat_breeds_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class CatBreedsRemoteDatasource {
  Future<CatBreedsResponse> getData();
}

class CatBreedsRemoteDatasourceImpl implements CatBreedsRemoteDatasource {
  final http.Client client;
  final String apiKey =
      'live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr';

  CatBreedsRemoteDatasourceImpl({required this.client});

  @override
  Future<CatBreedsResponse> getData() async {
    final response = await client.get(
      Uri.parse('https://api.thecatapi.com/v1/breeds'),
      headers: {'x-api-key': apiKey},
    );
    log(response.toString());

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return CatBreedsResponse.fromJson(data);
    } else {
      throw Exception('Failed to load');
    }
  }
}
