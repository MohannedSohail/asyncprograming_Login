
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


Widget show(String text,Color mycolor){
  return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: mycolor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.close,color: Colors.white,),
          SizedBox(
            width: 10.0,
          ),
          Text(text,style: TextStyle(color: Colors.white),),
        ],
      ),
    );}


Widget checkshow(String text,Color mycolor){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: mycolor,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.check,color: Colors.white,),
        SizedBox(
          width: 10.0,
        ),
        Text(text,style: TextStyle(color: Colors.white),),
      ],
    ),
  );}
