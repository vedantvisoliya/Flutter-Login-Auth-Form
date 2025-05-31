import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_auth_form/components/my_button.dart';
import 'package:login_auth_form/components/my_square_tile.dart';
import 'package:login_auth_form/components/my_text_field.dart';
import 'package:login_auth_form/services/auth_service.dart';
// import 'package:flutter/foundation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailAddress = TextEditingController();
  final TextEditingController _password = TextEditingController();
  Color errorBarColor = Colors.blue;

  // final RegExp _emailRegExp = RegExp(
  //   r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$",
  // );

  // void _validateEmail() {
  //   final text = _emailAddress.text;
  //   setState(() {
  //     if (text.isEmpty) {
  //       errorBarColor = Colors.red;
  //     } else if (!_emailRegExp.hasMatch(text)) {
  //         errorBarColor = Colors.red;
  //     } else {
  //       errorBarColor = Colors.blue;
  //     }
  //   });
  // }

  @override
  void dispose() {
    _emailAddress.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 52, 172, 247),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Container(
              width: screenWidth - ((screenWidth / 6) * 2),
              height: screenHeight,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(color: Color.fromARGB(255, 0, 107, 237)),
              child: Center(
                child: Column(
                  children: [
                    // back button
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
          
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 115.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Log in
                          Text(
                            "Login",
                            style: GoogleFonts.victorMono(
                              fontSize: screenWidth > 650 ? 42:24,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                            ),
                          ),
                      
                          const SizedBox(height: 10),
                      
                          // welcome back, you've been missed!
                          Text(
                            "Welcome back, you've been missed!",
                            style: GoogleFonts.victorMono(
                              fontSize: screenWidth > 650 ? 19:14,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: Colors.black,
                            ),
                          ),
                      
                          const SizedBox(height: 25),
                      
                          // email text field
                          MyTextField(
                            controller: _emailAddress,
                            obscureText: false,
                            labelText: "What's your email?",
                            errorBarColor: errorBarColor,
                          ),
                      
                          const SizedBox(height: 15.0),
                      
                          // password  text field
                          MyTextField(
                            inputType: TextInputType.text,
                            controller: _password,
                            obscureText: true,
                            labelText: "Enter your password.",
                            errorBarColor: errorBarColor,
                          ),
                      
                          const SizedBox(height: 5.0,),
          
                          // forget password
                          SizedBox(
                            width: 350,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "forget password?",
                                  style: GoogleFonts.victorMono(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      
                          const SizedBox(height: 15.0),
                      
                          // enter button
                          MyButton(
                            text: "Enter",
                            imagePath: "assets/icons/enter.png",
                            onTap: () => AuthService().signUserIn(
                              context, 
                              emailAddress: _emailAddress.text, 
                              password: _password.text,
                            ),
                            bgColor: Color.fromARGB(255, 0, 150, 136),
                            textColor: Colors.white,
                            imageColor: Colors.black,
                          ),
          
                          const SizedBox(height: 15.0,),
          
                          // or continue with
                          SizedBox(
                            width: 350,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    thickness: 1.7,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  " or continue with ",
                                  style: GoogleFonts.victorMono(
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    thickness: 1.7,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
          
                          const SizedBox(height: 25.0,),
          
                          // sign in with google and apple id
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // GOOGLE
                              MySquareTile(
                                imagePath: "assets/icons/google.png", 
                                onTap: () => AuthService().signInWithGoogleForWeb(context),
                              ),
          
                              const SizedBox(width: 25.0,),
          
                              // APPLE
                              MySquareTile(
                                imagePath: "assets/icons/apple.png", 
                                onTap: () {},
                              ),
                            ],
                          )
                        ],
                      ),
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
}
