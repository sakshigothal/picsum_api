// To parse this JSON data, do
//
//     final picsumApiSec = picsumApiSecFromJson(jsonString);

import 'dart:convert';

List<PicsumApiSec> picsumApiSecFromJson(String str) => List<PicsumApiSec>.from(json.decode(str).map((x) => PicsumApiSec.fromJson(x)));

String picsumApiSecToJson(List<PicsumApiSec> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PicsumApiSec {
    PicsumApiSec({
       required  this.id,
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

    factory PicsumApiSec.fromJson(Map<String, dynamic> json) => PicsumApiSec(
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
