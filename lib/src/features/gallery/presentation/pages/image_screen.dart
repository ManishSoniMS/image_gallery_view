import 'package:flutter/material.dart';

import '../../domain/entity/image_entity.dart';
import '../widgets/grid_tile_widget.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({Key? key, required this.photo}) : super(key: key);

  static const String routeName = '/image';
  final Photo photo;

  static Route route(Photo photo) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ImageScreen(photo: photo),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(),
      extendBodyBehindAppBar: true,
      body: InteractiveViewer(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: GridTileWidget(photo: photo),
          ),
        ),
      ),
    );
  }
}
