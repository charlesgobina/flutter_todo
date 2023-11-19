import 'package:flutter/material.dart';

class Formfields {
  static Widget emailField(
      {required TextEditingController controller,
      String? label,
      required String hint,
      required Color backColor,
      required Icon icon,
      TextStyle? textStyle,
      required bool obscureText}) {
    return TextFormField(
      controller: controller,
      style: textStyle,
      decoration: InputDecoration(
        filled: true,
        fillColor: backColor,
        labelText: label,
        hintText: hint,
        prefixIcon: icon,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      obscureText: obscureText,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please an email';
        } else if (!value.contains('@')) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }

  static Widget passwordField(
      {required TextEditingController controller,
      String? label,
      required String hint,
      required Icon icon,
      required Color backColor,
      TextStyle? textStyle,
      required IconButton suffixIcon,
      required bool obscureText}) {
    return TextFormField(
      controller: controller,
      style: textStyle,
      decoration: InputDecoration(
        filled: true,
        labelText: label,
        hintText: hint,
        prefixIcon: icon,
        suffixIcon: suffixIcon,
        fillColor: backColor,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      obscureText: obscureText,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a password';
        } else if (value.length < 8) {
          return 'Password must be at least 8 characters';
        } else if (!value.contains(RegExp(r'[0-9]'))) {
          return 'Password must contain a number';
        } else if (!value.contains(RegExp(r'[A-Z]'))) {
          return 'Password must contain an uppercase letter';
        } else if (!value.contains(RegExp(r'[a-z]'))) {
          return 'Password must contain a lowercase letter';
        } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
          return 'Password must contain a special character';
        }
        return null;
      },
    );
  }

  static Widget nameField(
      {required TextEditingController controller,
      String? label,
      required String hint,
      required Icon icon,
      required Color backColor,
      TextStyle? textStyle,
      required bool obscureText}) {
    return TextFormField(
      controller: controller,
      style: textStyle,
      decoration: InputDecoration(
        filled: true,
        fillColor: backColor,
        labelText: label,
        hintText: hint,
        prefixIcon: icon,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      obscureText: obscureText,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }

  // form button
  static Widget formButton(
      {required String text,
      TextStyle? style,
      required Color buttonColor,
      required Color borderColor,
      required Function()? onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(
            color: borderColor,
          ),
        ),
        minimumSize: const Size(400, 50),
      ),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
