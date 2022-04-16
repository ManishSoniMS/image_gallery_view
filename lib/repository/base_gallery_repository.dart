import 'package:image_gallery_view/models/image_model.dart';

abstract class BaseGalleryRepository {
  Future<List<ImageModel>?> fetchImages();
}
