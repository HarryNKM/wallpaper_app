import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/screen/home/provider/home_provider.dart';
import 'package:wallpaper_app/utils/routes.dart';

void main()
{
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: WallpaperProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: app_routes,
    ),
  ));
}