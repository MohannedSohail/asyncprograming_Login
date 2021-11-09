import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';
import 'resultscreen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  var _email;
  var _password;

  @override
  void initState() {
    super.initState();
    print(" MySplashScreen Email => ${_email}");
    print(" MySplashScreen Password => ${_password}");
  }
  @override
  Widget build(BuildContext context) {

    getData();

    print(" MySplashScreen Email => ${_email}");
    print(" MySplashScreen Password => ${_password}");
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 4), () => _email!=null && _password!=null ? Result_Screen():Login()),
        builder: (con, snapshot) {
          if(snapshot.hasData){
            return _email!=null && _password!=null ? Result_Screen():Login();
          }else{
            return buildMaterialApp();
          }
        },);
  }
  Future getData() async {
    SharedPreferences _data= await SharedPreferences.getInstance();
    _email=_data.getString("email");
    _password=_data.getString("password");
  }

}

  Scaffold buildMaterialApp() {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: Colors.blue),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/svg2.svg",
                    ),
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.blue),
            ),
          ],
        ),
      ),
    );

  }




