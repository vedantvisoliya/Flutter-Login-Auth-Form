import 'package:flutter/material.dart';
import 'package:login_auth_form/components/my_text_field.dart';
import 'package:login_auth_form/services/data.dart';
import 'package:provider/provider.dart';

class RegisterPage1 extends StatelessWidget {
  const RegisterPage1({super.key});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final TextEditingController emailAddress = TextEditingController();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 52, 172, 247),
      body: Center(
        child: Container(
          height: screenHeight,
          width: screenWidth-(screenWidth/2),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 0, 107, 237),
          ),
          child: Center(
            child: 
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context), 
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 27,
                        ),
                      ),
                    ],
                  ),
                      
                  const SizedBox(height: 220,),
                      
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 85.0),
                    child: Material(
                      elevation: 7.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyTextField(
                              elevation: 0,
                              controller: emailAddress, 
                              obscureText: false, 
                              labelText: "What's your email?", 
                              errorBarColor: Colors.blue,
                            ),
                        
                            const SizedBox(width: 10.0,),
                        
                            IconButton(
                              onPressed: () {
                                Provider.of<Data>(context, listen: false).emailAddress = emailAddress.text;
                                Navigator.pushNamed(context, '/r2');
                              },
                              icon: Icon(
                                Icons.arrow_forward,
                                color: Colors.blue,
                                size: 32,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}