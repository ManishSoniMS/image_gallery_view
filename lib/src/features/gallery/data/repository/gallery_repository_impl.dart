import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/base/base_repository.dart';
import '../../../../core/base/type_def.dart';
import '../../../../core/error/exception_to_failure_mapper.dart';
import '../../domain/entity/image_entity.dart';
import '../../domain/repositories/base_gallery_repository.dart';
import '../source/network_source.dart';

@LazySingleton(as: IGalleryRepository)
class GalleryRepositoryImpl extends IBaseRepository
    implements IGalleryRepository {
  final INetworkSource _source;

  GalleryRepositoryImpl(this._source);

  @override
  FailureOr<ImageEntity> fetchImages() async {
    try {
      final result = await _source.fetchImages();
      return Right(result);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}
