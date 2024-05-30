import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaper_app/screen/home/modal/home_modal.dart';
class ApiHelper
{
  Future<WallpaperModal?> getApi()
  async {
    String? wallpaperLink="https://pixabay.com/api/?key=44142058-366a967efa1c822fa73dbb354&q=spiderman&orientation=vertical";
    var response=await http.get(Uri.parse(wallpaperLink));

    if(response.statusCode==200)
      {
        var json=jsonDecode(response.body);
        WallpaperModal modal=WallpaperModal.mapToModal(json);
        return modal;
      }
    return null;
  }
}