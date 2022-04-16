part of 'gallery_bloc.dart';

abstract class GalleryEvent extends Equatable {
  const GalleryEvent();
  @override
  List<Object> get props => [];
}

class GalleryLoad extends GalleryEvent {
  final List<ImageModel> images;

  const GalleryLoad({this.images = const <ImageModel>[]});

  @override
  List<Object> get props => [images];
}
