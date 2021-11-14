import 'package:asyncprograming/sharedpreferanceswithlogin/pageview_model.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'drawindicator.dart';
import 'login.dart';
import 'splash_screen.dart';

class MyPageView extends StatefulWidget {
  @override
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  List<PageViewData> myData = [
    PageViewData(
        title: "Login App ",
        description: "description description description description",
        imageUrl: "assets/Login3.png"),
    PageViewData(
        title: "Login App ",
        description: "description description description description",
        imageUrl: "assets/Login4.png"),
    PageViewData(
        title: "Login App ",
        description: "description description description description",
        imageUrl: "assets/Login1.png"),
    // PageViewData(title: "Login App ", description: "description description description description", imageUrl: "assets/Login4.png"),
    // PageViewData(title: "Login App ", description: "description description description description", imageUrl: "assets/Login5.png"),
  ];

  int _currentInx = 0;
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Spacer(),
            Expanded(
              flex: 6,
              child: PageView.builder(
                controller: _controller,
                itemCount: myData.length,
                itemBuilder: (con, index) => LoginPageView(
                    title: myData[index].title,
                    description: myData[index].description,
                    img: myData[index].imageUrl),
                onPageChanged: (val) {
                  setState(() {
                    _currentInx = val;
                  });
                },
              ),
            ),
            Expanded(
                flex:2,
                child: Builder(
                  builder: (con) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                          DrawIndicators(
                              repeatCount: myData.length,
                              currentInx: _currentInx),
                          SizedBox(
                            height:20,
                          ),
                          InkWell(
                            onTap: () async{
                              if (_currentInx < myData.length - 1) {
                                _controller.nextPage(
                                    duration: Duration(milliseconds: 800),
                                    curve: Curves.easeInOutQuint);
                              } else {
                                SharedPreferences _data= await SharedPreferences.getInstance();
                                  _data.setBool("isShow", true);
                                
                                Navigator.of(con).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (_) => Login()));
                              }
                            },
                            child: AnimatedContainer(
                                alignment: Alignment.center,
                                width: (_currentInx== myData.length-1)? 200 : 50,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                duration: Duration(milliseconds: 300),
                                height:45 ,
                                child: (_currentInx == myData.length - 1)
                                    ? Text(
                                  "Get Started",
                                  style: TextStyle(
                                      backgroundColor: Colors.blue,
                                      color: Colors.white),
                                )
                                    : Icon(
                                  Icons.navigate_next,
                                  color: Colors.white,
                                  size: 30,
                                )),
                          ),

                        // This Is dots_indicator Library
                        // DotsIndicator(
                        //   dotsCount: myData.length,
                        //   position: _currentInx.toDouble(),
                        //   decorator: DotsDecorator(
                        //     size: const Size.square(9.0),
                        //     activeSize: const Size(18.0, 9.0),
                        //     activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                        //   ),
                        // ),

                        // Builder(builder: (con) {
                        //   return Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       DrawIndicators(
                        //           repeatCount: myData.length,
                        //           currentInx: _currentInx),
                        //       SizedBox(
                        //         width: 10,
                        //       ),
                        //       InkWell(
                        //         onTap: () {
                        //           if (_currentInx < myData.length - 1) {
                        //             _controller.nextPage(
                        //                 duration: Duration(milliseconds: 800),
                        //                 curve: Curves.easeInOutQuint);
                        //           } else {
                        //             Navigator.of(con).pushReplacement(
                        //                 MaterialPageRoute(
                        //                     builder: (_) => MySplashScreen()));
                        //           }
                        //         },
                        //         child: AnimatedContainer(
                        //           alignment: Alignment.center,
                        //             width: (_currentInx== myData.length-1)? 200 : 50,
                        //             decoration: BoxDecoration(
                        //               color: Colors.blue,
                        //               borderRadius: BorderRadius.circular(30),
                        //             ),
                        //             duration: Duration(milliseconds: 300),
                        //           height:40 ,
                        //             child: (_currentInx == myData.length - 1)
                        //                 ? Text(
                        //                     "Get Started",
                        //                     style: TextStyle(
                        //                         backgroundColor: Colors.blue,
                        //                         color: Colors.white),
                        //                   )
                        //                 : Icon(
                        //                     Icons.navigate_next,
                        //                     color: Colors.white,
                        //                     size: 30,
                        //                   )),
                        //       ),
                        //     ],
                        //   );
                        // }),
                      ],
                    );
                  }
                )),
          ],
        ),
      ),
    );
  }
}

class LoginPageView extends StatelessWidget {
  String title, description, img;

  LoginPageView(
      {required this.title, required this.description, required this.img});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Image.asset(
          img,
          height: 365,
          width: 400,
        ),
      ],
    );
  }
}
