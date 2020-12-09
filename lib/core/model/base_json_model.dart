import 'dart:convert';

abstract class BaseJsonModel<T> {
  Map<String, dynamic> toJson();
  T baseFromJson(Map<String, dynamic> json);
  String toJsonString() => jsonEncode(toJson());
  T baseFromJsonString(String json) => baseFromJson(jsonDecode(json));
}
