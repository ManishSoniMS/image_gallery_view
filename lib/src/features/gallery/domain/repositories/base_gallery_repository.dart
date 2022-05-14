import '../../../../core/base/type_def.dart';
import '../entity/image_entity.dart';

abstract class IGalleryRepository {
  FailureOr<ImageEntity> fetchImages();
}
