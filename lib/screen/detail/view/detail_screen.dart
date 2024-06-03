import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/screen/home/modal/home_modal.dart';

class WallPapaerScreen extends StatefulWidget {
  const WallPapaerScreen({super.key});

  @override
  State<WallPapaerScreen> createState() => _WallPapaerScreenState();
}

class _WallPapaerScreenState extends State<WallPapaerScreen> {
  @override
  Widget build(BuildContext context) {
    HitsModal modal = ModalRoute.of(context)!.settings.arguments as HitsModal;
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
      body: CachedNetworkImage(
        imageUrl: "${modal.largeImageURL}",
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        fit: BoxFit.cover,
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          AsyncWallpaper.setWallpaper(
            url: "${modal.largeImageURL}",
            wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
            goToHome: true,
            toastDetails: ToastDetails.success(),
            errorToastDetails: ToastDetails.error(),
          );
      },child: const Icon(Icons.save_alt,color: Colors.white,),),

    );
  }
}
