// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:picsum_api_example/models/picsumphotosmodel.dart';

class PicsumApiCall extends StatefulWidget {
  const PicsumApiCall({ Key? key }) : super(key: key);

  @override
  _PicsumApiCallState createState() => _PicsumApiCallState();
}

class _PicsumApiCallState extends State<PicsumApiCall> {

  PicsumApi? pics;
  List<PicsumApi> data=[];
  List decodedata=[];
  

  apicall()async {
    var resp= await http.get(Uri.parse("https://picsum.photos/v2/list"));
    print(resp.contentLength);

    setState(() {
      decodedata=jsonDecode(resp.body);

      for (var item in decodedata) {
        data.add(PicsumApi.fromJson(item));
        print(data.length);

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
    return Scaffold(
      body:Container(
        child: ListView.builder(itemBuilder: (BuildContext, index){
          return ListTile(
            title: Text(data[index].author)
          );
        },itemCount: data.length,),
      )
    );
  }
}