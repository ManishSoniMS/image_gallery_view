import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_gallery_view/src/core/error/failure.dart';
import 'package:image_gallery_view/src/features/gallery/domain/entity/image_entity.dart';
import 'package:image_gallery_view/src/features/gallery/domain/repositories/base_gallery_repository.dart';
import 'package:injectable/injectable.dart';

part 'gallery_state.dart';
part 'gallery_cubit.freezed.dart';

@injectable
class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit(this._repository) : super(Initial());

  final IGalleryRepository _repository;

  Future<void> fetch() async {
    final result = await _repository.fetchImages();
    result.fold(
      (l) => emit(GalleryState.failure(l)),
      (r) => emit(GalleryState.loaded(r)),
    );
  }
}
