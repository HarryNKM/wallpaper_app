import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/screen/home/modal/home_modal.dart';

import '../../home/provider/home_provider.dart';

class WallPapaerScreen extends StatefulWidget {
  const WallPapaerScreen({super.key});

  @override
  State<WallPapaerScreen> createState() => _WallPapaerScreenState();
}

class _WallPapaerScreenState extends State<WallPapaerScreen> {
  WallpaperProvider? providerR;
  WallpaperProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<WallpaperProvider>();
    providerR = context.read<WallpaperProvider>();
    WallpaperModal modal =
        ModalRoute.of(context)!.settings.arguments as WallpaperModal;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: const Text(
          "Wallpapers",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: PageView.builder(
        itemCount: modal.hits!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CachedNetworkImage(
            imageUrl: "${modal.hits![providerW!.index!].largeImageURL}",
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            fit: BoxFit.cover,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          AsyncWallpaper.setWallpaper(
            url: "${modal.hits![providerW!.index!].largeImageURL}",
            wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
            goToHome: true,
            toastDetails: ToastDetails.success(),
            errorToastDetails: ToastDetails.error(),
          );
        },
        child: const Icon(
          Icons.save_alt,
          color: Colors.white,
        ),
      ),
    );
  }
}
