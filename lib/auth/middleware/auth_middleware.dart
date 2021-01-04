import 'package:dio/dio.dart';

import '../../core/locator.dart';
import '../../core/service/storage_service.dart';

dynamic aktuelimdeAuthMiddleware(RequestOptions options) async {
  final storageService = locator<StorageService>();
  final token = storageService.getString('access_token');
  if (token != null) {
    options.headers.addAll(
      {'Authorization': 'Bearer $token'},
    );
  } else {
    print('NO TOKEN FOUND');
  }
  return options;
}
