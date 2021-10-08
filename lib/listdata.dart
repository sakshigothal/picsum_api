import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:picsum_api_example/common.dart';
import 'package:picsum_api_example/models/secondmodel.dart';
import 'package:http/http.dart' as http;

class ListData extends StatefulWidget {
  const ListData({Key? key}) : super(key: key);

  @override
  _ListDataState createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  PicsumApiSec? pics;
  List<PicsumApiSec> data = [];
  List decodedata = [];
  List listpage = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  var resp;

  apicall() async {
    for (int i=4;i<=10;i++) {
    resp = await http
        .get(Uri.parse("https://picsum.photos/v2/list?page=$i&limit=100"));
    // item++;
    }
    print("....");

    setState(() {
      decodedata = jsonDecode(resp.body);

      for (var item in decodedata) {
        data.add(PicsumApiSec.fromJson(item));
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apicall();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 660,
            width: 400,
            // color: Colors.cyanAccent,
            child: ListView.builder(
              itemBuilder: (BuildContext, index) {
                return ListTile(title: Text(data[index].author));
              },
              itemCount: data.length,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text("Next"),
              ),
              SizedBox(width: 10,)
            ],
          ),
        ],
      )),
    );
  }
}
