import 'dart:io';

import 'package:dio/dio.dart';

import '../model/base_json_model.dart';
import 'http_service.dart';

class DioHttpService extends HttpService {
  final Dio dio;

  DioHttpService() : dio = Dio() {
    dio.interceptors.add(
      InterceptorsWrapper(
          // onRequest: authMiddleware,
          // onError: (e) {
          //   print('Middleware error: $e');
          // },
          ),
    );
  }

  @override
  Future<HttpResult> fetch(
    String path,
    HttpRequestType requestType, {
    payload,
    Map<String, dynamic> queryParameters,
  }) async {
    return await _resolveRequest(
      path,
      requestType,
      payload: payload,
      queryParameters: queryParameters,
    );
  }

  @override
  Future<HttpResult<T>> fetchAndParse<T, D>(
    String path,
    HttpRequestType requestType,
    BaseJsonModel<D> parseModel, {
    payload,
    Map<String, dynamic> queryParameters,
  }) async {
    return await _resolveRequest<T, D>(
      path,
      requestType,
      parseModel: parseModel,
      payload: payload,
      queryParameters: queryParameters,
    );
  }

  Future<HttpResult<T>> _resolveRequest<T, D>(
    String path,
    HttpRequestType requestType, {
    BaseJsonModel<D> parseModel,
    dynamic payload,
    Map<String, dynamic> queryParameters,
  }) async {
    try {
      final requestString = requestType.str;
      final response = await dio.request(
        path,
        data: payload,
        queryParameters: queryParameters,
        options: Options(
          method: requestString,
        ),
      );
      final code = response.statusCode;
      final message = response.statusMessage;
      final data = response.data;

      if (code >= 200 && code < 300) {
        if (parseModel != null) {
          final model = _responseParser<T, D>(parseModel, data);
          return HttpResult<T>(
            code: code,
            body: message,
            success: true,
            data: model,
          );
        } else {
          return HttpResult<T>(
            code: code,
            body: message,
            success: true,
            data: data,
          );
        }
      }

      return HttpResult<T>(
        code: code,
        body: message,
        success: false,
      );
    } catch (e) {
      return HttpResult<T>(
        code: 500,
        body: 'HTTP Exception Caught',
        success: false,
        data: null,
      );
    }
  }

  T _responseParser<T, D>(BaseJsonModel<D> model, dynamic data) {
    if (data is List) {
      return data.map((e) => model.baseFromJson(e)).toList() as T;
    } else if (data is Map) {
      return model.baseFromJson(data) as T;
    }
    return data as T;
  }
}
