import 'dart:convert';
import 'package:crypto/crypto.dart';

class HelperFunctions {
  String hashPassword(String password) {
    List<int> passwordBytes = utf8.encode(password);
    Digest digest = sha256.convert(passwordBytes);
    String hashedPassword = digest.toString();
    return hashedPassword;
  }
}
