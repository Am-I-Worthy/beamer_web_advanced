import 'package:beamer/beamer.dart';
import 'package:beamer_web_advanced/Locations/main_screen_locations.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final _beamerKey = GlobalKey<BeamerState>();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SideNav(beamer: _beamerKey)),
        Expanded(
          child: Container(
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Beamer(
              key: _beamerKey,
              routerDelegate: BeamerDelegate(
                // NOTE First Method
                // locationBuilder: RoutesLocationBuilder(
                //   routes: {
                //     '*': (context, state, data) => const SizedBox(),
                //     '/settings': (context, state, data) {
                //       print(state.pathPatternSegments);
                //       if (state.pathPatternSegments.contains('account')) {
                //         return BeamPage(
                //           key: ValueKey('AccountsSettings - ${DateTime.now()}'),
                //           type: BeamPageType.scaleTransition,
                //           child: const AccountSettings(),
                //         );
                //       } else if (state.pathPatternSegments
                //           .contains('profile')) {
                //         return BeamPage(
                //           key: ValueKey('ProfileSettings - ${DateTime.now()}'),
                //           type: BeamPageType.scaleTransition,
                //           child: const ProfileSettings(),
                //         );
                //       }
                //       return BeamPage(
                //         key: ValueKey('Settings - ${DateTime.now()}'),
                //         type: BeamPageType.scaleTransition,
                //         child: const Settings(),
                //       );
                //     },
                //     '/dashboard': (context, state, data) => const BeamPage(
                //           key: ValueKey('Dashboard'),
                //           type: BeamPageType.scaleTransition,
                //           child: Dashboard(),
                //         ),
                //     '/profile': (context, state, data) => const BeamPage(
                //           key: ValueKey('Profile'),
                //           type: BeamPageType.scaleTransition,
                //           child: Profile(),
                //         ),
                //     '/notifications': (context, state, data) => const BeamPage(
                //           key: ValueKey('Notification'),
                //           type: BeamPageType.scaleTransition,
                //           child: Notifications(),
                //         ),
                //     '/about': (context, state, data) => const BeamPage(
                //           key: ValueKey('About'),
                //           type: BeamPageType.scaleTransition,
                //           child: About(),
                //         ),
                //   },
                // ),

                // NOTE Secondary Method
                locationBuilder: (routeInfo, data) {
                  if (routeInfo.location!.contains('dashboard')) {
                    return DashboardLocation(routeInfo);
                  }
                  if (routeInfo.location!.contains('settings')) {
                    return SettingsLocation(routeInfo);
                  }
                  if (routeInfo.location!.contains('profile')) {
                    return ProfileLocation(routeInfo);
                  }
                  if (routeInfo.location!.contains('notifications')) {
                    return NotificationLocation(routeInfo);
                  }
                  if (routeInfo.location!.contains('about')) {
                    return AboutLocation(routeInfo);
                  }
                  return NotFound(path: routeInfo.location!.toString());
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SideNav extends StatefulWidget {
  final GlobalKey<BeamerState> beamer;
  const SideNav({Key? key, required this.beamer}) : super(key: key);

  @override
  State<SideNav> createState() => _SideNavState();
}

class _SideNavState extends State<SideNav> {
  int selected = -1;
  @override
  void initState() {
    super.initState();
  }

  List<String> navItems = [
    'Dashboard',
    'Settings',
    'Profile',
    'Notifications',
    'About'
  ];
  List<String> navs = [
    '/dashboard',
    '/settings',
    '/profile',
    '/notifications',
    '/about'
  ];

  @override
  Widget build(BuildContext context) {
    final path = (context.currentBeamLocation.state as BeamState).uri.path;
    if (path.contains('/dashboard')) {
      selected = 0;
    } else if (path.contains('/settings')) {
      selected = 1;
    } else if (path.contains('/profile')) {
      selected = 2;
    } else if (path.contains('/notification')) {
      selected = 3;
    } else if (path.contains('/about')) {
      selected = 4;
    }
    return Container(
      // color: Colors.grey[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: navItems.map((navItem) {
          return AnimatedContainer(
            key: ValueKey(navItem),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: selected == navItems.indexOf(navItem)
                  ? Colors.grey[850]
                  : Colors.white,
            ),
            duration: const Duration(
              milliseconds: 375,
            ),
            width: 120.0,
            child: Material(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {
                  setState(() {
                    widget.beamer.currentState?.routerDelegate
                        .beamToNamed(navs[navItems.indexOf(navItem)]);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    navItem,
                    style: TextStyle(
                      color: selected == navItems.indexOf(navItem)
                          ? Colors.white
                          : Colors.grey[850],
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
