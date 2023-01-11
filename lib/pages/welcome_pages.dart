import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/responsive_button.dart';
import 'home_screen.dart';
import 'main_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "lib/icons/welcome.webp",
    "lib/icons/welcome3.webp",
    "lib/icons/welcome4.webp",
  ];
  List text=[
    ["Mountain","Mountain hikes gives you an increadible sense of freedom along with endurance."],
    ["Camping","Mountain hikes gives you an increadible sense of freedom along with endurance."],
    ["Desert","Mountain hikes gives you an increadible sense of freedom along with endurance."],
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: images.length,
            itemBuilder: (_, index) {
              return Container(
                height: double.maxFinite,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(images[index]), fit: BoxFit.cover)),
                child: Container(
                  margin: EdgeInsets.only(left: 20, top: 60, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Trips",
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          ),
                          Text(
                            text[index][0],
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade100),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 250,
                            child: Text(
                              text[index][1],
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey.shade200,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(height: 20,),
                          ResponsiveButton(
                            text: "Lets Discover",
                            onPressed: (){
                              Get.to(()=>MainPage());
                            },
                          )
                        ],
                      ),
                      Column(
                        children: List.generate(3, (indexdots) {
                          return Container(
                            width: 8,
                            margin: EdgeInsets.only(bottom: 2),
                            height: index==indexdots?25:10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index == indexdots ? Colors.deepPurple : Colors.white70
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
