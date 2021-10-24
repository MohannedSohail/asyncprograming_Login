import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';
import 'mytoast.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var email;

  var password;

  var _usernameController = TextEditingController();

  var _emailController = TextEditingController();

  var _passwordController = TextEditingController();

  var _repasswordController = TextEditingController();

  var _ageController = TextEditingController();

  var _countryController = TextEditingController();

  var _radioValue;
  // String _txt = "";
  // late SharedPreferences _prefs;


  @override
  Widget build(BuildContext context) {
    var ftoast = FToast();
    ftoast.init(context);


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Register Screen"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  textField("User Name", TextInputType.name, Icon(Icons.person),
                      _usernameController, false),
                  SizedBox(
                    height: 10,
                  ),
                  textField("Email", TextInputType.emailAddress,
                      Icon(Icons.email), _emailController, false),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: textField(
                              "Password",
                              TextInputType.visiblePassword,
                              Icon(Icons.lock),
                              _passwordController,
                              true)),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 1,
                          child: textField(
                              "Re_Password",
                              TextInputType.visiblePassword,
                              Icon(Icons.password),
                              _repasswordController,
                              true)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  textField("Age", TextInputType.number, Icon(Icons.date_range),
                      _ageController, false),
                  SizedBox(
                    height: 10,
                  ),
                  textField("Country", TextInputType.text,
                      Icon(Icons.location_city), _countryController, false),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      buildExpandedRadioListTile(1,"Male"),
                      SizedBox(width: 10,),
                      buildExpandedRadioListTile(2,"Female"),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blue),
                      child: MaterialButton(
                        onPressed: () async {
                          if (_usernameController.text.isNotEmpty &&
                              _usernameController.text != "") {
                            if (_passwordController.text.isNotEmpty &&
                                _repasswordController.text.isNotEmpty &&
                                _repasswordController.text ==
                                    _passwordController.text) {
                              if (_ageController.text.isNotEmpty &&
                                  _ageController.text != "") {
                                if (_countryController.text.isNotEmpty &&
                                    _countryController.text != "") {
                                  if (_emailController.text.isNotEmpty &&
                                      _emailController.text != "") {
                                    if(_radioValue!=0){
                                      SharedPreferences   _prefs =
                                      await SharedPreferences.getInstance();
                                      _prefs.setString(
                                          "username", _usernameController.text);
                                      _prefs.setString(
                                          "email", _emailController.text);
                                      _prefs.setString("password",
                                          _passwordController.text.toString());
                                      _prefs.setString(
                                          "age", _ageController.text.toString());
                                      _prefs.setString(
                                          "country", _countryController.text);
                                      _prefs.setInt(
                                          "Gender", _radioValue);

                                      ftoast.showToast(
                                        child: checkshow("Created Successfully",
                                            Colors.greenAccent),
                                        gravity: ToastGravity.BOTTOM,
                                        toastDuration: Duration(seconds: 2),
                                      );

                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (_) => Login(
                                            log_email:
                                            _emailController.value.text,
                                            log_password:
                                            _passwordController.value.text,
                                          ),
                                        ),
                                      );
                                      print(
                                          " User name => ${_usernameController.text}");
                                      print(" email => ${_emailController.text}");
                                      print(
                                          " password => ${_passwordController.text}");
                                      print(" Age => ${_ageController.text}");
                                      print(
                                          " Country => ${_countryController.text}");
                                      print(
                                          " Gender => ${_radioValue.toString()}");
                                    }else{

                                      ftoast.showToast(
                                        child:
                                        show("Fill your Gender", Colors.red),
                                        gravity: ToastGravity.BOTTOM,
                                        toastDuration: Duration(seconds: 2),
                                      );
                                    }

                                  } else {
                                    ftoast.showToast(
                                      child:
                                          show("Fill your Email", Colors.red),
                                      gravity: ToastGravity.BOTTOM,
                                      toastDuration: Duration(seconds: 2),
                                    );
                                  }
                                } else {
                                  ftoast.showToast(
                                    child:
                                        show("Fill your Country", Colors.red),
                                    gravity: ToastGravity.BOTTOM,
                                    toastDuration: Duration(seconds: 2),
                                  );
                                }
                              } else {
                                ftoast.showToast(
                                  child: show("Fill your Age", Colors.red),
                                  gravity: ToastGravity.BOTTOM,
                                  toastDuration: Duration(seconds: 2),
                                );
                              }
                            } else {
                              ftoast.showToast(
                                child: show(
                                    "Fill your Password \n Or Re_password ",
                                    Colors.red),
                                gravity: ToastGravity.BOTTOM,
                                toastDuration: Duration(seconds: 2),
                              );
                            }
                          } else {
                            ftoast.showToast(
                              child: show("Fill your User Name", Colors.red),
                              gravity: ToastGravity.BOTTOM,
                              toastDuration: Duration(seconds: 2),
                            );
                          }
                        },
                        child: Text(
                          "Create Account",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded buildExpandedRadioListTile(valuenum,txt) {
    return Expanded(
                        child: Container(
                      child: buildRadioListTile(valuenum, txt),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: BoxBorder.lerp(
                              Border.all(
                                  color: Colors.black38,
                                  style: BorderStyle.solid,
                                  width: 0.8),
                              Border.all(
                                  color: Colors.black38,
                                  style: BorderStyle.solid),
                              0.1)),
                    ));
  }

  RadioListTile<dynamic> buildRadioListTile(val,tit) {
    return RadioListTile(
      title: Text("$tit"),
  controlAffinity: ListTileControlAffinity.platform,
    activeColor: Colors.blue,
    selected:_radioValue==val ? true:false ,
      value: val,
      groupValue: _radioValue,
      onChanged: (value) {
        setState(() {
          _radioValue = value;
        });
      },
    );
  }
}

Widget textField(String hint, TextInputType type, Icon icons,
    TextEditingController controller, var obscureText) {
  return TextFormField(
    keyboardType: type,
    controller: controller,
    obscureText: obscureText,
    decoration: InputDecoration(
        hintText: hint,
        prefixIcon: icons,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
  );
}
