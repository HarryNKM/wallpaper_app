import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/screen/home/provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<WallpaperProvider>().getWallpaper();
  }

  WallpaperProvider? providerR;
  WallpaperProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<WallpaperProvider>();
    providerR = context.read<WallpaperProvider>();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Wallpapers",style: TextStyle(color: Colors.white),),
      ),
      body: GridView.builder(
        itemCount: providerW!.modal!.hits!.length,
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.network("${providerW!.modal!.hits![index].previewURL}",fit: BoxFit.cover,),
        );
      },)
    );
  }
}
