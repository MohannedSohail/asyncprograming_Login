import 'package:asyncprograming/sharedpreferanceswithlogin/resultscreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'mytoast.dart';
import 'register.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Login extends StatelessWidget {

  String? log_email="";
  String?log_password="";
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();

  Login({this.log_email , this.log_password});

  @override
  Widget build(BuildContext context) {
    // getdata();
    checkTextFiled();
    log_email=_emailController.text;
    log_password=_passwordController.text;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Login Screen"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(

                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.remove_red_eye),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: double.infinity,
                        // color: Colors.blue,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.blue),

                        child: Builder(
                          builder: (con) => MaterialButton(
                            onPressed: () {
                              print(" email => ${_emailController.text}");
                              print(" password => ${_passwordController.text}");

                              if(_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
                                Navigator.of(con).pushReplacement(MaterialPageRoute(
                                    builder: (_) => Result_Screen()));



                              }else{

                                var ftoast=FToast();
                                ftoast.init(con);
                                ftoast.showToast(
                                  child: show("Register To Login",Colors.red) ,
                                  gravity: ToastGravity.BOTTOM,
                                  toastDuration: Duration(seconds: 2),
                                );

                              }


                            },
                            child: Text(
                              "LOGIN",
                              style: TextStyle(color: Colors.white,fontSize: 18),
                            ),
                          ),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don\'t have an account?"),
                        Builder(builder :(ctx) => TextButton(onPressed: () async{

                          Navigator.of(ctx).push(MaterialPageRoute(builder: (_)=> Register( )));
                        }, child: Text("Register"))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future getData() async {
      SharedPreferences _data= await SharedPreferences.getInstance();
          var _email=_data.getString("email");
      var _password=_data.getString("password");
     }



     void checkTextFiled(){

    if(log_email !=null && log_password != null){

      _emailController.text=log_email  ??"";
      _passwordController.text=log_password ??"";

    }

     }

}
