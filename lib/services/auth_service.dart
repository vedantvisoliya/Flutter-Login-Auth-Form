// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_auth_form/services/data.dart';
import 'package:provider/provider.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // error dialog 
  void errorDialog(BuildContext context, String error){
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        backgroundColor: Colors.amber,
        title: Center(
          child: Text(
            "Error Occured!",
            style: GoogleFonts.victorMono(
              color: Colors.red,
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ), 
        ),
        content: Text(
          "error: $error",
          style: GoogleFonts.victorMono(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // create user method
  void createUser(BuildContext context) async {
    try{
      // ignore: unused_local_variable
      UserCredential newCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: Provider.of<Data>(context, listen: false).emailAddress, 
        password: Provider.of<Data>(context, listen: false).password,
      );  
      Navigator.popUntil(context, ModalRoute.withName('/'));
    } on FirebaseAuthException catch (e) {
      errorDialog(context, e.code);
    }
  }
  // sign user in method
  void signUserIn(BuildContext context, {required String emailAddress, required String password}) async {
    // circular progress indicator for loading
    showDialog(
      context: context, 
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try{
      // ignore: unused_local_variable
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: emailAddress, 
        password: password,
      );
      // for circular progress indicator to pop up
      Navigator.pop(context);
      // for login page to pop up
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      errorDialog(context, e.code);
    }
  }

  // sign user in with google for web
  Future<void> signInWithGoogleForWeb(BuildContext context) async {
    try {
      GoogleAuthProvider authProvider = GoogleAuthProvider();
      // ignore: unused_local_variable
      UserCredential userCredential = await _firebaseAuth.signInWithPopup(authProvider);
    } on FirebaseAuthException catch (e) {
      errorDialog(context, e.code);
    }
  }

  // sign user out method
  void signUserOut() {
    _firebaseAuth.signOut();
  }
}