import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swifty/widgets/SlidedPageContents.dart';

void main() {
  runApp(MaterialApp(
    title: 'Onboarding App',
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

List<PageSlidedContents> myList = [
  PageSlidedContents(
      imagepath: "Saly-1.png",
      title: 'Boost Productivity',
      description: "Facio helps your productivity on a different level"),
  PageSlidedContents(
      imagepath: "Saly-2.png",
      title: "Work Seamlessly ",
      description: "Get your work done seamlessly without interruption"),
  PageSlidedContents(
      imagepath: "Saly-3.png",
      title: "Achieve Higher Goals",
      description:
      "By boosting your productivity, we help you achieve higher goals")
];

class _HomePageState extends State<HomePage> {
  int current_index = 0;
  PageController pageViewController = PageController(initialPage: 0); //This helps use to change the pages
                                                                      //By clicking on the skip and next buttons
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1c1b19),
      body: PageView.builder(
          onPageChanged: (index) {
            setState(() {
              current_index = index;
            });
          },
          controller: pageViewController,
          itemCount: myList.length,
          itemBuilder: (context, index) {
            return myList[index];
          }),
      bottomSheet: current_index != myList.length - 1
          ? Container(
        color: Color(0xFF1c1b19),
        height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(onTap: () {
                pageViewController.animateToPage(myList.length-1, duration: Duration(milliseconds: 500) , curve: Curves.easeIn);
              }, child: Text("SKIP", style: TextStyle(color: Colors.white),)),
              Row(
                children: [
                  for (int i = 0; i < myList.length; i++)
                    current_index == i
                        ? pageIndexInidcator(true)
                        : pageIndexInidcator(false)
                ],
              ),
              InkWell(onTap: () {
                pageViewController.animateToPage(current_index+1, duration: Duration(milliseconds: 500) , curve: Curves.easeIn);
              }, child: Text("NEXT", style: TextStyle(color: Colors.white))),
            ],
          ),
        ),
      )
          : Container(
        child: Container(
          height: 80,
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          color: Colors.orange,
            child: Text("Get Started",textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20),)),
      ),
    );
  }
}

Widget pageIndexInidcator(bool isCurrentPage) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 3.0),
    child: Container(
      width: isCurrentPage ? 50 : 10,
      height: 10,
      decoration: BoxDecoration(
          color: isCurrentPage ? Colors.deepOrangeAccent : Colors.white,
          borderRadius: BorderRadius.circular(6)),
    ),
  );
}
