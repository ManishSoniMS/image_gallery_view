import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../../../core/configs/keys.dart';
import '../../domain/entity/image_entity.dart';

abstract class INetworkSource {
  Future<ImageEntity> fetchImages();
}

@LazySingleton(as: INetworkSource)
class NetworkSourceImpl implements INetworkSource {
  @override
  Future<ImageEntity> fetchImages() async {
    final uri =
        Uri.parse("https://api.pexels.com/v1/curated?page=1&per_page=40");

    final http.Response response =
        await http.get(uri, headers: {"Authorization": pexelsApiKey});
    final map = jsonDecode(response.body);
    final images = ImageEntity.fromMap(map);
    return images;
  }
}
