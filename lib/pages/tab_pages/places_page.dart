import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../mount_detail_page.dart';

class PlacesPage extends StatefulWidget {
  PlacesPage({Key? key}) : super(key: key);

  @override
  State<PlacesPage> createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {
  List data=[];

  _readData() async{
    DefaultAssetBundle.of(context).loadString("lib/json/place_mountain.json").then((value) {
      data=json.decode(value);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _readData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.35,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (_, index) {
            return InkWell(
              onTap: (){
                Get.to(()=>MountDetailPage(),arguments: {
                  'name': data[index]['name'].toString(),
                  'location': data[index]['location'].toString(),
                  'image': data[index]['image'].toString(),
                  'fare': data[index]['fare'].toString(),
                  'rating': data[index]['rating'],
                  'description':data[index]['description']
                });
              },
              child: Container(
                margin: EdgeInsets.only(left: 20, top: 15, bottom: 5),
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(image: AssetImage(data[index]['image']),fit: BoxFit.cover),
                    color: Colors.deepPurple),
                padding: EdgeInsets.only(left: 15,bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(data[index]['name'],style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600),),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Icon(Icons.location_on,color: Colors.blue.shade100,),
                        SizedBox(width: 10,),
                        Text(data[index]['location'],style: TextStyle(fontSize: 18,color: Colors.white),)
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
