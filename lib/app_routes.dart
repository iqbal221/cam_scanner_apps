import 'package:cam_scanner/presentation/screens/camera_screen.dart';
import 'package:cam_scanner/presentation/screens/home_screen.dart';
import 'package:cam_scanner/presentation/screens/preview_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> routes(RouteSettings settings) {
    Widget widget = SizedBox();

    if (settings.name == HomeScreen.name) {
      widget = HomeScreen();
    } else if (settings.name == CameraScreen.name) {
      widget = CameraScreen();
    } else if (settings.name == PreviewScreen.name) {
      widget = PreviewScreen();
    }

    return MaterialPageRoute(builder: (ctx) => widget);
  }
}
