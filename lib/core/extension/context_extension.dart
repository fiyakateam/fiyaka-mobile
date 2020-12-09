import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double dynamicWidth(double val) => MediaQuery.of(this).size.width * val;
  double dynamicHeight(double val) => MediaQuery.of(this).size.height * val;

  // For 16pt paddings
  EdgeInsets get paddingAll => EdgeInsets.all(
        dynamicHeight(0.05),
      );
  EdgeInsets get paddingSymmetricVertical => EdgeInsets.symmetric(
        vertical: dynamicHeight(0.05),
      );
  EdgeInsets get paddingSymmetricHorizontal => EdgeInsets.symmetric(
        horizontal: dynamicWidth(0.05),
      );
}
