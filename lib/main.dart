import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_view/bloc/simple_bloc_observer.dart';
import 'package:image_gallery_view/presentation/screens/home/bloc/gallery_bloc.dart';
import 'package:image_gallery_view/presentation/screens/home/view/home_screen.dart';
import 'package:image_gallery_view/repository/gallery_repository.dart';
import 'package:image_gallery_view/utils/app_router.dart';
import 'presentation/screens/home/bloc/gallery_bloc.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GalleryRepository>(
            create: (context) => GalleryRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<GalleryBloc>(
              create: (context) => GalleryBloc(
                  galleryRepository: context.read<GalleryRepository>())
                ..add(const GalleryLoad())),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Image Gallery View',
          theme: ThemeData.dark().copyWith(
            cardColor: Colors.black,
            appBarTheme: const AppBarTheme(
                backgroundColor: Color(0x00000000), elevation: 0),
          ),
          initialRoute: HomeScreen.routeName,
          onGenerateRoute: AppRouter.onGenerateRoute,
        ),
      ),
    );
  }
}
