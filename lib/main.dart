import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_view/src/app/injection/dependencies_injection.dart';

import 'simple_bloc_observer.dart';
import 'src/app/flavors/app_dev.dart';

void main() {
  configureDependencies();
  BlocOverrides.runZoned(
    () => runApp(const DevApp()),
    blocObserver: SimpleBlocObserver(),
  );
}
