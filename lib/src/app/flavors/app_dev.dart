import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/gallery/presentation/cubit/gallery_cubit.dart';
import '../../features/gallery/presentation/pages/home_screen.dart';
import '../../router/app_router.dart';
import '../injection/dependencies_injection.dart';

class DevApp extends StatelessWidget {
  const DevApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GalleryCubit>(
          create: (context) => sl()..fetch(),
        ),
      ],
      child: const _App(),
    );
  }
}

class _App extends StatelessWidget {
  const _App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Gallery View',
      theme: ThemeData.dark().copyWith(
        cardColor: Colors.black,
        appBarTheme:
            const AppBarTheme(backgroundColor: Color(0x00000000), elevation: 0),
      ),
      initialRoute: HomeScreen.routeName,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
