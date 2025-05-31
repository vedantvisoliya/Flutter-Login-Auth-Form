import 'package:flutter/material.dart';

class Data extends ChangeNotifier {
  late String emailAddress;
  late String password;
  late String confirmPassword;

  bool checkPassword() {
    return password == confirmPassword;
  }
}
