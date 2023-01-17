import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import 'api_key.dart';

abstract class INewsService {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiKeys.baseURL));
  Future getNews();
}

class NewsService extends INewsService {
  final String _pathNews = "&apikey=${ApiKeys.apiKeyId}";
  @override
  Future getNews() async {
    try {
      final response = await _dio.get(_pathNews);

      if (response.statusCode == HttpStatus.ok) {
        return response.data;
      } else {
        log("Status Code: ${response.statusCode} \n Status Message: ${response.statusMessage}");
      }
    } on DioError catch (e) {
      log("Error Message: $e");
    }
    throw UnimplementedError();
  }
}
