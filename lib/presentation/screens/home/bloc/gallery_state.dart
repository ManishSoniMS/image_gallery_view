part of 'gallery_bloc.dart';

enum Status { initial, success, failure }

class GalleryState extends Equatable {
  final List<ImageModel> images;
  final Status status;

  const GalleryState({
    this.images = const <ImageModel>[],
    this.status = Status.initial,
  });

  GalleryState copyWith({
    List<ImageModel>? images,
    Status? status,
  }) {
    return GalleryState(
      images: images ?? this.images,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [images, status];
}
