import 'package:asyncprograming/shared_components.dart';
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

  // var _countryController = TextEditingController();

  var _radioValue;

  // String _txt = "";
  // late SharedPreferences _prefs;

  var _selectedCountry;
  List _countryList = ["Palestine", "USA", "UK", "UAE", "SA", "China", "Cairo"];

  bool isPasswordShow = true;
  bool isRePasswordShow = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var ftoast = FToast();
    ftoast.init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Register Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
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
                  defaultTextFormField(
                    controller: _usernameController,
                    type: TextInputType.name,
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "User Name Must Not Be Empty";
                      }
                    },
                    labelTxt: "User Name",
                    prefixIcon: Icons.person_outline_rounded,
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  defaultTextFormField(
                    controller: _emailController,
                    type: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "Email Must Not Be Empty";
                      }
                    },
                    labelTxt: "Email",
                    prefixIcon: Icons.email_outlined,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: defaultTextFormField(
                            controller: _passwordController,
                            type: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return "Password Must Not Be Empty";
                              }
                            },
                            labelTxt: "Password",
                            prefixIcon: Icons.lock_outline_rounded,
                            suffixIcon: isPasswordShow
                                ? Icons.remove_red_eye_rounded
                                : Icons.visibility_off_outlined,
                            obscureText: isPasswordShow,
                            suffixOnPressed: () {
                              setState(() {
                                isPasswordShow = !isPasswordShow;
                              });
                            }),
                      ),
                      // child: textField(
                      //     "Password",
                      //     TextInputType.visiblePassword,
                      //     Icon(Icons.lock),
                      //     _passwordController,
                      //     true)),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          flex: 1,
                          child: defaultTextFormField(
                              controller: _repasswordController,
                              type: TextInputType.visiblePassword,
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return "RePassword Must Not Be Empty";
                                }
                              },
                              labelTxt: "RePassword",
                              prefixIcon: Icons.password_outlined,
                              suffixIcon: isRePasswordShow
                                  ? Icons.remove_red_eye_rounded
                                  : Icons.visibility_off_outlined,
                              obscureText: isRePasswordShow,
                              suffixOnPressed: () {
                                setState(() {
                                  isRePasswordShow = !isRePasswordShow;
                                });
                              })),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  defaultTextFormField(
                    controller: _ageController,
                    type: TextInputType.datetime,
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "Age Must Not Be Empty";
                      }
                    },
                    labelTxt: "Age",
                    prefixIcon: Icons.date_range_rounded,
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  // textField("Country", TextInputType.text,
                  //     Icon(Icons.location_city), _countryController, false),
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: buildDropdownButton(),
                    ),
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
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      buildExpandedRadioListTile(1, "Male"),
                      SizedBox(
                        width: 15,
                      ),
                      buildExpandedRadioListTile(2, "Female"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultButton(function: ()async{
                    if (formKey.currentState!.validate()) {
                      if (_usernameController.text.isNotEmpty &&
                          _usernameController.text != "") {
                        if (_passwordController.text.isNotEmpty &&
                            _repasswordController.text.isNotEmpty &&
                            _repasswordController.text ==
                                _passwordController.text) {
                          if (_ageController.text.isNotEmpty &&
                              _ageController.text != "") {
                            if (_selectedCountry != null &&
                                _selectedCountry.toString().isNotEmpty) {
                              if (_emailController.text.isNotEmpty &&
                                  _emailController.text != "") {
                                if (_radioValue != 0) {
                                  SharedPreferences _prefs =
                                      await SharedPreferences
                                      .getInstance();
                                  _prefs.setString("username",
                                      _usernameController.text);
                                  _prefs.setString(
                                      "email", _emailController.text);
                                  _prefs.setString(
                                      "password",
                                      _passwordController.text
                                          .toString());
                                  _prefs.setString("age",
                                      _ageController.text.toString());
                                  _prefs.setString(
                                      "country", _selectedCountry);
                                  _prefs.setInt("Gender", _radioValue);

                                  ftoast.showToast(
                                    child: checkshow(
                                        "Created Successfully",
                                        Colors.greenAccent),
                                    gravity: ToastGravity.BOTTOM,
                                    toastDuration: Duration(seconds: 2),
                                  );

                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (_) => Login(
                                        log_email:
                                        _emailController.value.text,
                                        log_password: _passwordController
                                            .value.text,
                                      ),
                                    ),
                                  );
                                } else {
                                  ftoast.showToast(
                                    child: show(
                                        "Select your Gender", Colors.red),
                                    gravity: ToastGravity.BOTTOM,
                                    toastDuration: Duration(seconds: 2),
                                  );
                                }
                              }
                            } else {
                              ftoast.showToast(
                                child: show(
                                    "select your Country", Colors.red),
                                gravity: ToastGravity.BOTTOM,
                                toastDuration: Duration(seconds: 2),
                              );
                            }
                          }
                        }
                      }
                    }


                  }, txt: "Create Account",radius: 10,isUpperCase: true),
                  // Container(
                  //     width: double.infinity,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(5),
                  //         color: Colors.blue),
                  //     child: MaterialButton(
                  //       onPressed: () async {
                  //         if (formKey.currentState!.validate()) {
                  //           if (_usernameController.text.isNotEmpty &&
                  //               _usernameController.text != "") {
                  //             if (_passwordController.text.isNotEmpty &&
                  //                 _repasswordController.text.isNotEmpty &&
                  //                 _repasswordController.text ==
                  //                     _passwordController.text) {
                  //               if (_ageController.text.isNotEmpty &&
                  //                   _ageController.text != "") {
                  //                 if (_selectedCountry != null &&
                  //                     _selectedCountry.toString().isNotEmpty) {
                  //                   if (_emailController.text.isNotEmpty &&
                  //                       _emailController.text != "") {
                  //                     if (_radioValue != 0) {
                  //                       SharedPreferences _prefs =
                  //                           await SharedPreferences
                  //                               .getInstance();
                  //                       _prefs.setString("username",
                  //                           _usernameController.text);
                  //                       _prefs.setString(
                  //                           "email", _emailController.text);
                  //                       _prefs.setString(
                  //                           "password",
                  //                           _passwordController.text
                  //                               .toString());
                  //                       _prefs.setString("age",
                  //                           _ageController.text.toString());
                  //                       _prefs.setString(
                  //                           "country", _selectedCountry);
                  //                       _prefs.setInt("Gender", _radioValue);
                  //
                  //                       ftoast.showToast(
                  //                         child: checkshow(
                  //                             "Created Successfully",
                  //                             Colors.greenAccent),
                  //                         gravity: ToastGravity.BOTTOM,
                  //                         toastDuration: Duration(seconds: 2),
                  //                       );
                  //
                  //                       Navigator.of(context).pushReplacement(
                  //                         MaterialPageRoute(
                  //                           builder: (_) => Login(
                  //                             log_email:
                  //                                 _emailController.value.text,
                  //                             log_password: _passwordController
                  //                                 .value.text,
                  //                           ),
                  //                         ),
                  //                       );
                  //                     } else {
                  //                       ftoast.showToast(
                  //                         child: show(
                  //                             "Select your Gender", Colors.red),
                  //                         gravity: ToastGravity.BOTTOM,
                  //                         toastDuration: Duration(seconds: 2),
                  //                       );
                  //                     }
                  //                   }
                  //                 } else {
                  //                   ftoast.showToast(
                  //                     child: show(
                  //                         "select your Country", Colors.red),
                  //                     gravity: ToastGravity.BOTTOM,
                  //                     toastDuration: Duration(seconds: 2),
                  //                   );
                  //                 }
                  //               }
                  //             }
                  //           }
                  //         }
                  //       },
                  //
                  //       // onPressed: () async {
                  //       //   if (_usernameController.text.isNotEmpty &&
                  //       //       _usernameController.text != "") {
                  //       //     if (_passwordController.text.isNotEmpty &&
                  //       //         _repasswordController.text.isNotEmpty &&
                  //       //         _repasswordController.text ==
                  //       //             _passwordController.text) {
                  //       //       if (_ageController.text.isNotEmpty &&
                  //       //           _ageController.text != "") {
                  //       //         if (_selectedCountry != null &&
                  //       //             _selectedCountry
                  //       //                 .toString()
                  //       //                 .isNotEmpty) {
                  //       //           if (_emailController.text.isNotEmpty &&
                  //       //               _emailController.text != "") {
                  //       //             if (_radioValue != 0) {
                  //       //               SharedPreferences _prefs =
                  //       //               await SharedPreferences.getInstance();
                  //       //               _prefs.setString(
                  //       //                   "username", _usernameController.text);
                  //       //               _prefs.setString(
                  //       //                   "email", _emailController.text);
                  //       //               _prefs.setString("password",
                  //       //                   _passwordController.text.toString());
                  //       //               _prefs.setString(
                  //       //                   "age",
                  //       //                   _ageController.text.toString());
                  //       //               _prefs.setString(
                  //       //                   "country", _selectedCountry);
                  //       //               _prefs.setInt("Gender", _radioValue);
                  //       //
                  //       //               ftoast.showToast(
                  //       //                 child: checkshow("Created Successfully",
                  //       //                     Colors.greenAccent),
                  //       //                 gravity: ToastGravity.BOTTOM,
                  //       //                 toastDuration: Duration(seconds: 2),
                  //       //               );
                  //       //
                  //       //               Navigator.of(context).pushReplacement(
                  //       //                 MaterialPageRoute(
                  //       //                   builder: (_) =>
                  //       //                       Login(
                  //       //                         log_email:
                  //       //                         _emailController.value.text,
                  //       //                         log_password:
                  //       //                         _passwordController.value.text,
                  //       //                       ),
                  //       //                 ),
                  //       //               );
                  //       //               print(
                  //       //                   " User name => ${_usernameController
                  //       //                       .text}");
                  //       //               print(
                  //       //                   " email => ${_emailController.text}");
                  //       //               print(
                  //       //                   " password => ${_passwordController
                  //       //                       .text}");
                  //       //               print(" Age => ${_ageController.text}");
                  //       //               print(
                  //       //                   " Country => ${_selectedCountry
                  //       //                       .toString()}");
                  //       //               print(
                  //       //                   " Gender => ${_radioValue
                  //       //                       .toString()}");
                  //       //             } else {
                  //       //               ftoast.showToast(
                  //       //                 child:
                  //       //                 show("Fill your Gender", Colors.red),
                  //       //                 gravity: ToastGravity.BOTTOM,
                  //       //                 toastDuration: Duration(seconds: 2),
                  //       //               );
                  //       //             }
                  //       //           } else {
                  //       //             ftoast.showToast(
                  //       //               child: show(
                  //       //                   "Fill your Email", Colors.red),
                  //       //               gravity: ToastGravity.BOTTOM,
                  //       //               toastDuration: Duration(seconds: 2),
                  //       //             );
                  //       //           }
                  //       //         } else {
                  //       //           ftoast.showToast(
                  //       //             child:
                  //       //             show("Select your Country", Colors.red),
                  //       //             gravity: ToastGravity.BOTTOM,
                  //       //             toastDuration: Duration(seconds: 2),
                  //       //           );
                  //       //         }
                  //       //       } else {
                  //       //         ftoast.showToast(
                  //       //           child: show("Fill your Age", Colors.red),
                  //       //           gravity: ToastGravity.BOTTOM,
                  //       //           toastDuration: Duration(seconds: 2),
                  //       //         );
                  //       //       }
                  //       //     } else {
                  //       //       ftoast.showToast(
                  //       //         child: show(
                  //       //             "Fill your Password \n Or Re_password ",
                  //       //             Colors.red),
                  //       //         gravity: ToastGravity.BOTTOM,
                  //       //         toastDuration: Duration(seconds: 2),
                  //       //       );
                  //       //     }
                  //       //   } else {
                  //       //     ftoast.showToast(
                  //       //       child: show("Fill your User Name", Colors.red),
                  //       //       gravity: ToastGravity.BOTTOM,
                  //       //       toastDuration: Duration(seconds: 2),
                  //       //     );
                  //       //   }
                  //       // },
                  //       child: Text(
                  //         "Create Account",
                  //         style: TextStyle(color: Colors.white, fontSize: 18),
                  //       ),
                  //     )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  DropdownButtonHideUnderline buildDropdownButton() {
    return DropdownButtonHideUnderline(
        child: DropdownButton(
      isExpanded: true,
      icon: Icon(Icons.location_city),
      borderRadius: BorderRadius.circular(15),
      items: _countryList.map((country) {
        return DropdownMenuItem(
          alignment: AlignmentDirectional.center,
          child: Text(
            country,
          ),
          value: country,
        );
      }).toList(),
      value: _selectedCountry,
      hint: Text("Select You Country "),
      onChanged: (value) {
        setState(() {
          _selectedCountry = value;
        });
      },
    ));
  }

  Expanded buildExpandedRadioListTile(valueNum, txt) {
    return Expanded(
        child: Container(
      child: buildRadioListTile(valueNum, txt),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: BoxBorder.lerp(
              Border.all(
                  color: Colors.black38, style: BorderStyle.solid, width: 0.8),
              Border.all(color: Colors.black38, style: BorderStyle.solid),
              0.1)),
    ));
  }

  RadioListTile<dynamic> buildRadioListTile(val, tit) {
    return RadioListTile(
      title: Text("$tit"),
      controlAffinity: ListTileControlAffinity.platform,
      activeColor: Colors.blue,
      selected: _radioValue == val ? true : false,
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
