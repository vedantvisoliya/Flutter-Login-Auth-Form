import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_auth_form/services/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 107, 237),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () => AuthService().signUserOut(), 
            icon: Icon(
              Icons.logout_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Welcome Aboard!",
          style: GoogleFonts.victorMono(
            color: Colors.white,
            fontSize: 42,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}