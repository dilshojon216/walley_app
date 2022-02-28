import 'dart:convert';

import 'package:walley_app/src/config/other/constanta.dart';
import 'package:walley_app/src/data/models/photos_model.dart';
import 'package:http/http.dart' as http;

class ApiPhotos {
  Future<List<PhotosModel>> getCurated({int? page, int? prePage}) async {
    try {
      var response = await http.get(
          Uri.parse("${BASEURL_PIXSEl}curated?per_page=$prePage&page=$page"),
          headers: {
            "Authorization": APIKEY,
          });
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return PhotosModel.fromJsonList(data);
      } else {
        throw response.statusCode;
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
