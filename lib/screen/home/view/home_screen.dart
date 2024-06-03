import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/screen/home/modal/home_modal.dart';
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

  TextEditingController controller = TextEditingController();
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
          title: const Text(
            "Wallpapers",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            SearchBar(
                hintText: "Search",
                textInputAction: TextInputAction.search,
                keyboardType: TextInputType.text,
                controller: controller,
                trailing: [
                  IconButton(
                      onPressed: () {
                        providerW!.searchData(controller.text);
                        FocusManager.instance.primaryFocus?.unfocus();
                        controller.clear();
                      },
                      icon: Icon(Icons.search)),
                ]),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  TextButton(
                      onPressed: () {
                        providerW!.searchData("Nature");
                      },
                      child: const Text(
                        "Nature",
                        style: TextStyle(color: Colors.white),
                      )),
                  TextButton(
                      onPressed: () {
                        providerW!.searchData("car");
                      },
                      child: const Text(
                        "Cars",
                        style: TextStyle(color: Colors.white),
                      )),
                  TextButton(
                      onPressed: () {
                        providerW!.searchData("Gaming");
                      },
                      child: const Text(
                        "Gaming",
                        style: TextStyle(color: Colors.white),
                      )),
                  TextButton(
                      onPressed: () {
                        providerW!.searchData("Bikes");
                      },
                      child: const Text(
                        "Bikes",
                        style: TextStyle(color: Colors.white),
                      )),
                  TextButton(
                      onPressed: () {
                        providerW!.searchData("Love");
                      },
                      child: const Text(
                        "Love",
                        style: TextStyle(color: Colors.white),
                      )),
                  TextButton(
                      onPressed: () {
                        providerW!.searchData("Trending");
                      },
                      child: const Text(
                        "Trending",
                        style: TextStyle(color: Colors.white),
                      )),
                  TextButton(
                      onPressed: () {
                        providerW!.searchData("Fashion");
                      },
                      child: const Text(
                        "Fashion",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: providerW!.modal,
                builder: (context, snapshot) {
                  WallpaperModal? modal = snapshot.data;
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else if (snapshot.hasData) {
                    return GridView.builder(
                      itemCount: modal!.hits!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: InkWell(
                              onTap: () {
                                providerR!.addIndex(index);
                                Navigator.pushNamed(context, 'wallpaper',
                                    arguments: modal);
                              },
                              child: Image.network(
                                "${modal.hits![index].previewURL}",
                                fit: BoxFit.cover,
                              )),
                        );
                      },
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
