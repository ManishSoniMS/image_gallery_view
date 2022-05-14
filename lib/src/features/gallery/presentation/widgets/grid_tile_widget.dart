import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../domain/entity/image_entity.dart';

const String errorImage =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCZTwq-SBg0TtFy68nSAq-CaHzBSi_YAssBMFc4TE7dIjNTPHpSXDuX-tED9HESy8YJt4&usqp=CAU';

class GridTileWidget extends StatelessWidget {
  const GridTileWidget({
    Key? key,
    required this.photo,
  }) : super(key: key);
  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: ValueKey(photo.id),
      child: CachedNetworkImage(
        imageUrl: photo.src.original,
        fit: BoxFit.cover,
        placeholder: (context, _) {
          return Shimmer.fromColors(
            period: const Duration(milliseconds: 1000),
            baseColor: Theme.of(context).cardColor.withOpacity(0.1),
            highlightColor: Theme.of(context).scaffoldBackgroundColor,
            child: Container(
              color: Theme.of(context).cardColor,
            ),
          );
        },
        errorWidget: (context, _, __) {
          return CachedNetworkImage(
            imageUrl: errorImage,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
