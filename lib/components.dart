import 'package:flutter/material.dart';

Container defaultButton(
    {double? width = double.infinity,
    Color color =  Colors.blue,
      Gradient? gradient,
    bool isUpperCase = true,
    double? radius,
    double? fontSize,
    required VoidCallback function,
    required String txt}) {
  return Container(
    width: width,
    decoration: BoxDecoration(
        color: color,
        gradient: gradient,
        borderRadius: BorderRadius.circular(radius!)),
    child: MaterialButton(
      onPressed: function,
      child: Text(isUpperCase ? txt.toUpperCase() : txt,
          style: TextStyle(color: Colors.white,fontSize: fontSize)),
    ),
  );
}

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged? onSubmit,
  ValueChanged? onChange,
  required FormFieldValidator validator,
  required String labelTxt,
  required IconData prefixIcon,
   IconData? suffixIcon,
  VoidCallback? suffixOnPressed,
  bool obscureText=false,
}) {
  return TextFormField(

    controller: controller,
    keyboardType: type,
    obscureText:obscureText ,
    onFieldSubmitted: onSubmit,
    onChanged: onChange,
    validator: validator,
    decoration: InputDecoration(
        labelText: labelTxt,
        prefixIcon:  Icon(prefixIcon),
        suffixIcon: IconButton(icon:Icon(suffixIcon),onPressed: suffixOnPressed),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        )),
  );
}
