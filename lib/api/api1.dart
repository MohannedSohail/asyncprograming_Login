import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api1 extends StatefulWidget {
  @override
  _Api1State createState() => _Api1State();
}

class _Api1State extends State<Api1> {
  @override
  void initState() {
    getPosts();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("API"),
        ),
        body: Center(
          child: FutureBuilder<List>(

            //ممكن نعمل تأخير في جلب البيانات زي السطر الثاني وممكن بدون تأخير مثل السطر الأول

            //1- // future: getPosts() ,
            /* 2- */ future: Future.delayed(Duration(seconds: 2), ()=> getPosts() ),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                 itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(snapshot.data?[index]['userId']!= null ?'${snapshot.data?[index]['userId']}': "Empty"),
                      trailing: Text('${snapshot.data?[index]['id']?? "Empty"}'),
                      title: Text(snapshot.data?[index]['title']),
                      subtitle: Text(snapshot.data?[index]['body']),

                    );
                  },
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }


  Future<List> getPosts() async {
    final url = "https://jsonplaceholder.typicode.com/posts";
    final res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      var obj = json.decode(res.body);
      return obj;
    } else {
      throw Exception("Error !");
    }
  }

}

