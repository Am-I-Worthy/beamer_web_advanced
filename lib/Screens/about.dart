import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Text('About',style: GoogleFonts.overpass(
              fontSize: 30.0,
              color: Colors.white,
              letterSpacing: 1.0,
            ),),
      ),
    );
  }
}
