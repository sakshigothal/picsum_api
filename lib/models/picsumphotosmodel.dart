// To parse this JSON data, do
//
//     final picsumApi = picsumApiFromJson(jsonString);

import 'dart:convert';

List<PicsumApi> picsumApiFromJson(String str) => List<PicsumApi>.from(json.decode(str).map((x) => PicsumApi.fromJson(x)));

String picsumApiToJson(List<PicsumApi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PicsumApi {
    PicsumApi({
       required this.id,
       required this.author,
       required this.width,
       required this.height,
       required this.url,
       required this.downloadUrl,
    });

    String id;
    String author;
    int width;
    int height;
    String url;
    String downloadUrl;

    factory PicsumApi.fromJson(Map<String, dynamic> json) => PicsumApi(
        id: json["id"],
        author: json["author"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        downloadUrl: json["download_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "author": author,
        "width": width,
        "height": height,
        "url": url,
        "download_url": downloadUrl,
    };
}
