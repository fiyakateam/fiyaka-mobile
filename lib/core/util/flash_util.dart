import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlashUtil {
  static void showText(BuildContext context, String text) {
    showFlash(
      context: context,
      builder: (context, controller) {
        return Flash.bar(
          position: FlashPosition.top,
          controller: controller,
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          borderRadius: BorderRadius.circular(
            4.0,
          ),
          // enableDrag: false,
          backgroundColor: Colors.black87,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
      duration: const Duration(seconds: 3),
    );
  }
}
