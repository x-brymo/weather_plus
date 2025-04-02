import 'package:dio/dio.dart';

class HandlerDio {
  static String baseUrl = 'https://api.openweathermap.org/data/2.5/';
  static String apiKey = '9a225278d3fcd66a97d513fa112df236';
  static final dioConnecting = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      queryParameters: {'appid': apiKey},
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      responseType: ResponseType.json,
      validateStatus: (status) {
        return status! < 500; // Accept all responses with status code < 500
      },
      followRedirects: false,
      maxRedirects: 5,
      receiveDataWhenStatusError: true,
      // Add any other options you need here
      // For example, you can set a custom user agent or enable gzip compression
      // userAgent: 'MyApp/1.0',
      // compress: true,
      // etc.
      
    ),
    
  );

}