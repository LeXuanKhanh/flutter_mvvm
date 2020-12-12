import 'package:dio/dio.dart';
import 'package:flutter_mvvm_di/NetworkManager/CurlLogInterceptor.dart';
import 'package:logger/logger.dart';

abstract class BaseNetwork {
  final dio = Dio();   // Provide a dio instance
  final logger = Logger();

  BaseNetwork() {
    // config header
    print("base network init");
    //dio.options.headers["Demo-Header"] = "demo header";
    dio.interceptors.add(LogInterceptor(responseBody: true));
    //dio.interceptors.add(CurlLogInterceptor());
  }
}