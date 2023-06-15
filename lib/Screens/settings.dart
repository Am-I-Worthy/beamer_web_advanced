import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: GoogleFonts.overpass(
                fontSize: 30.0,
                color: Colors.white,
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            InkWell(
              onTap: () {
                // _beamerKey.currentState?.routerDelegate.beamToNamed('/settings/profile');
                context.beamToNamed('/settings/profile');
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Profile Settings',
                  style: GoogleFonts.quicksand(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            InkWell(
              onTap: () {
                // _beamerKey.currentState?.routerDelegate
                //     .beamToNamed('/settings/account');
                context.beamToNamed('/settings/account');
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Account Settings',
                  style: GoogleFonts.quicksand(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            // context.beamToNamed('/settings');
            context.beamBack();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 22.0,
          ),
        ),
      ),
      backgroundColor: Colors.orange,
      body: Center(
        child: Text(
          'Profile Settings',
          style: GoogleFonts.overpass(
            fontSize: 30.0,
            color: Colors.white,
            letterSpacing: 1.0,
          ),
        ),
      ),
    );
  }
}

class AccountSettings extends StatelessWidget {
  const AccountSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            // context.beamToNamed('/settings');
            context.beamBack();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 22.0,
          ),
        ),
      ),
      backgroundColor: Colors.orange[900],
      body: Center(
        child: Text(
          'Account Settings',
          style: GoogleFonts.overpass(
            fontSize: 30.0,
            color: Colors.white,
            letterSpacing: 1.0,
          ),
        ),
      ),
    );
  }
}
