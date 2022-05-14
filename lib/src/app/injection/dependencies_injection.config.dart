// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/gallery/data/repository/gallery_repository_impl.dart'
    as _i5;
import '../../features/gallery/data/source/network_source.dart' as _i3;
import '../../features/gallery/domain/repositories/base_gallery_repository.dart'
    as _i4;
import '../../features/gallery/domain/usecases/fetch_image_usecase.dart' as _i6;
import '../../features/gallery/presentation/cubit/gallery_cubit.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initSL(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.INetworkSource>(() => _i3.NetworkSourceImpl());
  gh.lazySingleton<_i4.IGalleryRepository>(
      () => _i5.GalleryRepositoryImpl(get<_i3.INetworkSource>()));
  gh.lazySingleton<_i6.FetchImageUsecase>(
      () => _i6.FetchImageUsecase(get<_i4.IGalleryRepository>()));
  gh.factory<_i7.GalleryCubit>(
      () => _i7.GalleryCubit(get<_i4.IGalleryRepository>()));
  return get;
}
