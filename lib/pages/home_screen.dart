import 'package:flutter/material.dart';
import 'package:flutter_travel_app/pages/tab_pages/emotionpage.dart';
import 'package:flutter_travel_app/pages/tab_pages/inspiration_page.dart';
import 'package:flutter_travel_app/pages/tab_pages/places_page.dart';
import 'package:get/get.dart';

import '../widget/mytab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> mytab = [
    MyTab(
      text: "Places",
    ),
    MyTab(text: "Inspiration"),
    MyTab(text: "Emotion")
  ];
  List cat=[
    ["Kayaking","lib/icons/kayaking.png",Colors.deepPurple.shade100],
    ["Snorkeling","lib/icons/snorkeling.png",Colors.red.shade100],
    ["Ballooning","lib/icons/balloning.png",Colors.green.shade100],
    ["Hiking","lib/icons/hiking.png",Colors.blue.shade100],
    ["Paragliding","lib/icons/paragliding.png",Colors.orange.shade100],
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: mytab.length,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: height,
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //appbar
                Container(
                  margin:
                      EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.menu,
                        size: 30,
                      ),
                      Expanded(child: Container()),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.orangeAccent.withOpacity(0.3),
                            image: DecorationImage(
                                image: AssetImage("lib/icons/young-man.png"),
                                fit: BoxFit.cover)),
                      )
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "Discover",
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    )),
                //tab
                TabBar(
                  tabs: mytab,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: Colors.black,
                  indicatorWeight: 1,
                  unselectedLabelColor: Colors.blueGrey,
                ),
                //tabbarview
                Container(
                  height: height*0.37,
                  width: width,
                  child: TabBarView(children: [
                    PlacesPage(),
                    InspirationPage(),
                    EmotionPage()
                  ]),
                ),
                //text
                Container(
                  margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Explore more",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                      Text("See All",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400,color: Colors.blue),)
                    ],
                  ),
                ),
                SizedBox(
                  height: 140,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cat.length,
                      padding: EdgeInsets.only(left: 10),
                      itemBuilder: (_,index){
                    return Container(
                      margin: EdgeInsets.only(left: 10,right: 10),
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: cat[index][2]
                            ),
                            child: Center(
                              child: Image.asset(cat[index][1],height: 38,),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(cat[index][0],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.grey.shade600),)
                        ],
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
