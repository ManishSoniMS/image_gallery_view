import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_view/models/image_model.dart';
import 'package:image_gallery_view/repository/gallery_repository.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final GalleryRepository _galleryRepository;
  GalleryBloc({required GalleryRepository galleryRepository})
      : _galleryRepository = galleryRepository,
        super(const GalleryState()) {
    on<GalleryLoad>(_onLoad);
  }

  Future<void> _onLoad(GalleryEvent event, Emitter<GalleryState> emit) async {
    try {
      if (state.status == Status.initial) {
        emit(state.copyWith(status: Status.initial));
        List<ImageModel>? images = await _galleryRepository.fetchImages();

        return emit(state.copyWith(status: Status.success, images: images));
      }
    } catch (error) {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
