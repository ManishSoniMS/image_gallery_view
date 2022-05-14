import 'package:injectable/injectable.dart';

import '../../../../core/base/type_def.dart';
import '../../../../core/base/usecase.dart';
import '../entity/image_entity.dart';
import '../repositories/base_gallery_repository.dart';

@lazySingleton
class FetchImageUsecase implements IUsecase<ImageEntity, NoParam> {
  FetchImageUsecase(this._repository);

  final IGalleryRepository _repository;

  @override
  FailureOr<ImageEntity> call(NoParam param) async {
    return await _repository.fetchImages();
  }
}
