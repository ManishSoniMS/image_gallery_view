part of 'gallery_cubit.dart';

@freezed
class GalleryState with _$GalleryState {
  factory GalleryState.initial() = Initial;

  factory GalleryState.loaded(ImageEntity imageEntity) = Loaded;

  factory GalleryState.failure(Failure failure) = Failed;
}
