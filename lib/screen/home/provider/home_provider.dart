import 'package:flutter/material.dart';
import 'package:wallpaper_app/screen/home/modal/home_modal.dart';
import 'package:wallpaper_app/utils/api_helper.dart';

class WallpaperProvider with ChangeNotifier
{
  ApiHelper helper=ApiHelper();
  WallpaperModal? modal;
  Future<void> getWallpaper()
  async {
   modal=await helper.getApi();
   notifyListeners();
  }
}