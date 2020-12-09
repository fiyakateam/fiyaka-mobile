import 'package:meta/meta.dart';

import '../model/base_json_model.dart';

class HttpResult<T> {
  final int code;
  final String body;
  final bool success;
  final T data;

  HttpResult({
    @required this.code,
    @required this.body,
    @required this.success,
    this.data,
  });
}

enum HttpRequestType { GET, POST, PUT, DELETE }

extension HttpRequestToStringExtension on HttpRequestType {
  String get str {
    switch (this) {
      case HttpRequestType.GET:
        return 'GET';
      case HttpRequestType.POST:
        return 'POST';
      case HttpRequestType.DELETE:
        return 'DELETE';
      default:
        throw 'Error HttpRequestType';
    }
  }
}

abstract class HttpService {
  Future<HttpResult> fetch(
    String path,
    HttpRequestType requestType, {
    dynamic payload,
    Map<String, dynamic> queryParameters,
  });

  /// [T] return type of http response
  /// can be [list<D>] or plain [D]
  ///
  /// [D] parser model of the atom
  Future<HttpResult<T>> fetchAndParse<T, D>(
    String path,
    HttpRequestType requestType,
    BaseJsonModel<D> parseModel, {
    dynamic payload,
    Map<String, dynamic> queryParameters,
  });

  Future<HttpResult> GET(
    String path, {
    Map<String, dynamic> queryParameters,
  }) async {
    return await fetch(
      path,
      HttpRequestType.GET,
      queryParameters: queryParameters,
    );
  }

  Future<HttpResult> POST(
    String path, {
    dynamic payload,
  }) async {
    return await fetch(
      path,
      HttpRequestType.POST,
      payload: payload,
    );
  }

  Future<HttpResult<T>> getParsed<T, D>(
    String path,
    BaseJsonModel<D> parseModel, {
    Map<String, dynamic> queryParameters,
  }) async {
    return await fetchAndParse(
      path,
      HttpRequestType.GET,
      parseModel,
      queryParameters: queryParameters,
    );
  }

  Future<HttpResult<T>> postParsed<T, D>(
    String path,
    BaseJsonModel<D> parseModel, {
    dynamic payload,
  }) async {
    return await fetchAndParse(
      path,
      HttpRequestType.POST,
      parseModel,
      payload: payload,
    );
  }

  Future<HttpResult<T>> deleteParsed<T, D>(
    String path,
    BaseJsonModel<D> parseModel, {
    dynamic payload,
  }) async {
    return await fetchAndParse(
      path,
      HttpRequestType.DELETE,
      parseModel,
      payload: payload,
    );
  }
}
