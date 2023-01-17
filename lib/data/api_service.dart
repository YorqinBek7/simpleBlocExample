import 'dart:io';

import 'package:bloc_test/data/api_client.dart';
import 'package:bloc_test/data/model.dart';
import 'package:dio/dio.dart';

class ApiService {
  static Future<List<MemesModel>> getMemes() async {
    final Response response = await ApiClient.dio.get('get_memes');
    if (response.statusCode == HttpStatus.ok) {
      var data = response.data;
      return (data['data']['memes'] as List?)
              ?.map((e) => MemesModel.fromJson(e))
              .toList() ??
          [];
    }
    return [];
  }
}
