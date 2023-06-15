import 'package:beamer/beamer.dart';
import 'package:beamer_web_advanced/Locations/main_screen_locations.dart';
import 'package:beamer_web_advanced/landing_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final routerDelegate = BeamerDelegate(
    transitionDelegate: const NoAnimationTransitionDelegate(),

    // NOTE FIRST METHOD
    // locationBuilder: RoutesLocationBuilder(routes: {
    //   '*': (context, state, data) => const LandingScreen(),
    // }),

    // NOTE Second Method
    locationBuilder: (routeInformation, _) => HomeLocation(routeInformation),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
    );
  }
}
