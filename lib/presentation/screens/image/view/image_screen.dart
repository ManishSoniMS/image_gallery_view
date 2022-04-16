import 'package:flutter/material.dart';
import 'package:image_gallery_view/models/image_model.dart';
import 'package:image_gallery_view/presentation/widgets/grid_tile_widget.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({Key? key, required this.imageModel}) : super(key: key);

  static const String routeName = '/image';
  final ImageModel imageModel;

  static Route route(ImageModel imageModel) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ImageScreen(imageModel: imageModel),
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
            child: GridTileWidget(imageModel: imageModel),
          ),
        ),
      ),
    );
  }
}
