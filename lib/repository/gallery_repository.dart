import 'package:image_gallery_view/models/image_model.dart';
import 'package:image_gallery_view/repository/base_gallery_repository.dart';
import 'package:image_gallery_view/utils/utils.dart';

class GalleryRepository extends BaseGalleryRepository {
  @override
  Future<List<ImageModel>?> fetchImages() {
    List<ImageModel> images = [];
    return Future.delayed(const Duration(seconds: 2)).then((_) {
      final dummyList = [];
      for (int i = 0; i <= Utils.generateListLength(); i++) {
        dummyList.add({
          'url': 'https://picsum.photos/id/${Utils.generateImageId()}/800/1200',
        });
      }
      for (var map in dummyList) {
        images.add(ImageModel.fromMap(map));
      }
      return images;
    });
  }
}
