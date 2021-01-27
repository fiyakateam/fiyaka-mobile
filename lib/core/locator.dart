import 'package:fiyaka/auth/service/auth_service.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';

import 'service/device_info_service.dart';
import 'service/dio_http_service.dart';
import 'service/http_service.dart';
import 'service/storage_service.dart';

final locator = GetIt.instance;

Future<void> initLocator() async {
  final _httpService = DioHttpService();
  locator.registerSingleton<HttpService>(
    _httpService,
  );

  locator.registerLazySingleton(
    () => NavigationService(),
  );
  locator.registerLazySingleton(
    () => DialogService(),
  );

  final _deviceInfoService = await DeviceInfoService.create();
  locator.registerSingleton(
    _deviceInfoService,
  );

  final _storageService = await StorageService.create();
  locator.registerSingleton(
    _storageService,
  );

  final _authService = await AuthService(
    httpService: _httpService,
    storageService: _storageService,
  );
  locator.registerSingleton(
    _authService,
  );
}
