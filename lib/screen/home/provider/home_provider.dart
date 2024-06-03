import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/screen/home/modal/home_modal.dart';
import 'package:wallpaper_app/utils/api_helper.dart';

class WallpaperProvider with ChangeNotifier {
  ApiHelper helper = ApiHelper();
  Future<WallpaperModal?>? modal;
  String search="nature";

  void searchData(String s)
  {
    search=s;
    getWallpaper();
  }

  void getWallpaper() {
    modal = helper.getApi(q: search);
    notifyListeners();
  }
}
