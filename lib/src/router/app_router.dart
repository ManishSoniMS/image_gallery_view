import 'package:flutter/material.dart';

import '../features/gallery/domain/entity/image_entity.dart';
import '../features/gallery/presentation/pages/home_screen.dart';
import '../features/gallery/presentation/pages/image_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return HomeScreen.route();

      case ImageScreen.routeName:
        return ImageScreen.route(settings.arguments as Photo);

      default:
        return errorRoute();
    }
  }

  static Route errorRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error'),
        ),
      ),
    );
  }
}
