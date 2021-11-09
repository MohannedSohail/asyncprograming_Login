import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'login.dart';
import 'mytoast.dart';
import 'register.dart';

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
  var _genderval;
  var _gender;

  var ftoast=FToast();
  bool isProgress=false;


  @override
  void initState() {


    super.initState();

    getData();
    ftoast.init(context);

    print("------------------ One ---------------------");
    print(" User Name => ${_username}");
    print(" Email => ${_email}");
    print(" Password => ${_password}");
    print(" Age => ${_age}");
    print(" Country => ${_country}");
    print(" _genderval => ${_genderval}");
    print(" Gender => ${_genderval==1? _gender="Male": _genderval==2? _gender="Female":" "}");
  }

  @override
  Widget build(BuildContext context) {

    print("------------------ Two ---------------------");
    print(" User Name => ${_username}");
    print(" Email => ${_email}");
    print(" Password => ${_password}");
    print(" Age => ${_age}");
    print(" Country => ${_country}");
    print(" _genderval => ${_genderval}");
    print(" Gender => ${_genderval==1? _gender="Male": _genderval==2? _gender="Female":" "}");

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
              height: 300,
              decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 5,),
                Text("User Name: ${_username}",),
                Text("Email: ${_email}",),
                Text("Password: ${_password}",),
                Text("Age: ${_age}",),
                Text("Country: ${_country}",),
                Text("Gender: ${_genderval==1? _gender="Male": _genderval==2? _gender="Female":" "}",),
                SizedBox(height: 20,),


    if(isProgress)
                  CircularProgressIndicator(
                    backgroundColor: Colors.red,

                  ),
                SizedBox(height: 10,),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red),
            child: MaterialButton(onPressed: (){
                  clearData();
                  setState(() {
                    _username="";
                    _email="";
                    _password="";
                    _age="";
                    _country="";
                    _genderval="";
                    _gender="";
                    isProgress=true;
                  });
                  print("------------------ Three ---------------------");
                  print(" User Name => ${_username}");
                  print(" Email => ${_email}");
                  print(" Password => ${_password}");
                  print(" Age => ${_age}");
                  print(" Country => ${_country}");
                  print(" _genderval => ${_genderval}");
                  print(" Gender => ${_genderval==1? _gender="Male": _genderval==2? _gender="Female":" "}");


                  ftoast.showToast(
                    child: checkshow("Deleted Successfully ",Colors.greenAccent) ,
                    gravity: ToastGravity.BOTTOM,
                    toastDuration: Duration(seconds: 4),
                  );
                  Future.delayed(Duration(seconds: 3), ()=> Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (_) => Login())));

                }, child: Text("Clear Data"),textColor: Colors.white, ),
          )],
              ),
            ),
          ),
        ),
      ),
    );
  }




  Future getData() async {
    SharedPreferences _data= await SharedPreferences.getInstance();

    setState(() {

      _username=_data.getString("username");
      _email=_data.getString("email");
      _password=_data.getString("password");
      _age=_data.getString("age");
      _country=_data.getString("country");
      _genderval=_data.getInt("Gender");

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
      _data.remove("Gender");

    });
  }
}

