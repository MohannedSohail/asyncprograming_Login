
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';
import 'mytoast.dart';

class Result_Screen extends StatefulWidget {

  @override
  _Result_ScreenState createState() => _Result_ScreenState();




}

class _Result_ScreenState extends State<Result_Screen> {

  var _email;
  var _password;
  var _username;
  var _age;
  var _country;


  var ftoast=FToast();

  @override
  void initState() {
    super.initState();

    getdata();


    ftoast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Result Screen"),),
        body: Center(
          child: DefaultTextStyle(
            style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),
            child: Container(
              margin: EdgeInsets.all(20),
              width: double.infinity,
              height: 240,
              decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("User Name: ${_username}",),
                Text("Email: ${_email}",),
                Text("Password: ${_password}",),
                Text("Age: ${_age}",),
                Text("Country: ${_country}",),
                SizedBox(height: 20,),
                RaisedButton(onPressed: (){

                  clearData();

                  ftoast.showToast(
                    child: checkshow("Deleted Successfully ",Colors.greenAccent) ,
                    gravity: ToastGravity.BOTTOM,
                    toastDuration: Duration(seconds: 2),
                  );
                 Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => Login()));

                }, child: Text("Clear Data") ),
              ],
              ),
            ),
          ),
        ),
      ),
    );
  }




  void getdata() async {
    SharedPreferences _data= await SharedPreferences.getInstance();

    setState(() {

      _username=_data.getString("username");
      _email=_data.getString("email");
      _password=_data.getString("password");
      _age=_data.getString("age");
      _country=_data.getString("country");

    });

  }

  void clearData() async{
    SharedPreferences _data= await SharedPreferences.getInstance();

    setState(() {

      _data.remove("username");
     _data.remove("email");
      _data.remove("password");
      _data.remove("age");
      _data.remove("country");

    });
  }
}

