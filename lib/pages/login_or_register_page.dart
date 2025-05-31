import 'package:flutter/material.dart';
import 'package:login_auth_form/components/my_button.dart';

class LoginOrRegisterPage extends StatelessWidget {
  const LoginOrRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 52, 172, 247),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(
              onTap: () => Navigator.pushNamed(context, '/login'),
              text: "Login", 
              imagePath: "assets/icons/user.png"
            ),

            const SizedBox(height: 10,),

            MyButton(
              onTap: () => Navigator.pushNamed(context, '/r1'),
              text: "Register", 
              imagePath: "assets/icons/add-user.png",
            ),
          ],
        ),
      ),
    );
  }
}