import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text('Dashboard',style: GoogleFonts.overpass(
              fontSize: 30.0,
              color: Colors.white,
              letterSpacing: 1.0,
            ),),
      ),
    );
  }
}
