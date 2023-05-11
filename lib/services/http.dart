import 'package:dio/dio.dart';

final dio = Dio(BaseOptions(
  baseUrl: 'https://www.flickr.com/services/rest/',
  headers: {
    Headers.acceptHeader: 'application/json',
    Headers.contentTypeHeader: 'application/json'
  },
  connectTimeout: const Duration(seconds: 5),
  receiveTimeout: const Duration(seconds: 4),
));
