import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MountDetailPage extends StatefulWidget {
  MountDetailPage({Key? key}) : super(key: key);

  @override
  State<MountDetailPage> createState() => _MountDetailPageState();
}

class _MountDetailPageState extends State<MountDetailPage> {
  List count = [1, 2, 3, 4, 5];
  int _index=0;
  void changeIndex(int index){
    setState(() {
      _index=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 70,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Container(
                  height: 65,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black54, width: 1.6)),
                  child: IconButton(
                      onPressed: () {
                        Get.snackbar(
                          "Loved it",
                          "Your loved this mountain",
                          backgroundColor: Colors.white,
                        );
                      },
                      icon: Icon(
                        Icons.favorite_border_rounded,
                        size: 30,
                      )),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text(
                      "Book Trip Now",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    color: Colors.deepPurple,
                    height: 65,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                )
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: height * 0.42,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Get.arguments['image']),
                        fit: BoxFit.cover)),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.menu,
                              color: Colors.white,
                              size: 28,
                            )),
                        Icon(
                          Icons.more_vert,
                          size: 30,
                          color: Colors.white,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: height * 0.33,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 22),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //name
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Get.arguments['name'],
                                style: TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.w600),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.grey.shade700,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    Get.arguments['location'],
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey.shade600),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Expanded(child: Container()),
                          Text(
                            "\$${Get.arguments['fare']}",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue),
                          )
                        ],
                      ),
                      //rating bar
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: Get.arguments['rating'],
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 27,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "(${Get.arguments['rating']})",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "People",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Number of people in your group",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //group people
                      SizedBox(
                        height: 55,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (_, index) {
                              return Container(
                                margin: EdgeInsets.only(right: 10),
                                height: 55,
                                width: 60,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: _index==index ? Colors.black : Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Text(
                                  "${count[index]}",
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: _index==index ? Colors.white : Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //description
                      SizedBox(
                        height: 90,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(
                            Get.arguments['description'],
                            style: TextStyle(
                                fontSize: 17, color: Colors.grey.shade500),
                          ),
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
