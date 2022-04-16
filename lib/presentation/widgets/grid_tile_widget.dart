import 'package:flutter/material.dart';
import 'package:image_gallery_view/models/image_model.dart';
import 'package:shimmer/shimmer.dart';

class GridTileWidget extends StatelessWidget {
  const GridTileWidget({
    Key? key,
    required this.imageModel,
  }) : super(key: key);
  final ImageModel imageModel;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: ValueKey(imageModel.url),
      child: Image(
        image: NetworkImage(imageModel.url),
        fit: BoxFit.cover,
        errorBuilder: (context, _, __) {
          return const Icon(Icons.error);
        },
        gaplessPlayback: true,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Shimmer.fromColors(
            period: const Duration(milliseconds: 1000),
            baseColor: Theme.of(context).cardColor.withOpacity(0.1),
            highlightColor: Theme.of(context).scaffoldBackgroundColor,
            child: Container(
              color: Theme.of(context).cardColor,
            ),
          );
        },
      ),
    );
  }
}
