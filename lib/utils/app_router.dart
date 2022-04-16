import 'package:flutter/material.dart';
import 'package:image_gallery_view/models/image_model.dart';
import 'package:image_gallery_view/presentation/screens/home/view/home_screen.dart';
import 'package:image_gallery_view/presentation/screens/image/view/image_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return HomeScreen.route();

      case ImageScreen.routeName:
        return ImageScreen.route(settings.arguments as ImageModel);

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
