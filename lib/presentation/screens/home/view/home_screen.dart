import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_view/presentation/screens/home/bloc/gallery_bloc.dart';
import 'package:image_gallery_view/presentation/screens/image/view/image_screen.dart';
import 'package:image_gallery_view/presentation/widgets/grid_tile_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            centerTitle: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            expandedHeight: deviceHeight * 1 / 3,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Image Gallery View'),
              centerTitle: true,
            ),
          ),
          SliverFillRemaining(
            child: BlocBuilder<GalleryBloc, GalleryState>(
              builder: (context, state) {
                if (state.status == Status.initial) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.status == Status.failure) {
                  return const Center(child: Text('Something went wrong!'));
                }
                if (state.status == Status.success && state.images.isEmpty) {
                  return const Center(child: Text('No Data Found!'));
                }

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.0,
                      crossAxisCount: 3,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1),
                  itemCount: state.images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => Navigator.of(context).pushNamed(
                          ImageScreen.routeName,
                          arguments: state.images[index]),
                      child: GridTileWidget(imageModel: state.images[index]),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
