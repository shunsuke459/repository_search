import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  static DioClient? _instance;
  static Dio? _dio;

  DioClient._();

  static DioClient get instance {
    _instance ??= DioClient._();
    return _instance!;
  }

  static Dio get dio {
    _dio ??= Dio()
      ..interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      )
      ..options.contentType = 'application/json';

    return _dio!;
  }
}
