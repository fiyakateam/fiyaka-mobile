import 'package:flutter/material.dart';
import 'package:fiyaka/core/app.dart';
import 'package:fiyaka/core/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocator();
  runApp(MyApp());
}
