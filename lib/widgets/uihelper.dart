import 'package:flutter/material.dart';

class UiHelper {
  static customTextField(TextEditingController controller,String hint,String labletext,IconData icon,){
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          labelText: labletext,
          suffixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
          )
        ),
      ),
    );
  }
}