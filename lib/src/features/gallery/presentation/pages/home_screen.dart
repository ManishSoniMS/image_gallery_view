import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/gallery_cubit.dart';
import '../widgets/grid_tile_widget.dart';
import 'image_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const HomeScreen(),
    );
  }

  static final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            centerTitle: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            expandedHeight: size.height * 1 / 3,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Image Gallery View'),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
            child: BlocBuilder<GalleryCubit, GalleryState>(
              builder: (context, state) {
                return state.map(initial: (_) {
                  return const Center(child: CircularProgressIndicator());
                }, loaded: (loadedState) {
                  final list = loadedState.imageEntity.photos;
                  return GridView.builder(
                    shrinkWrap: true,
                    controller: _scrollController,
                    addAutomaticKeepAlives: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1.0,
                            crossAxisCount: 3,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1),
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () => Navigator.of(context).pushNamed(
                            ImageScreen.routeName,
                            arguments: list[index]),
                        child: GridTileWidget(photo: list[index]),
                      );
                    },
                  );
                }, failure: (failure) {
                  return Center(child: Text(failure.failure.message));
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
