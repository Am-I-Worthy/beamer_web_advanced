import 'package:beamer/beamer.dart';
import 'package:beamer_web_advanced/Screens/about.dart';
import 'package:beamer_web_advanced/Screens/dashboard.dart';
import 'package:beamer_web_advanced/Screens/notification.dart';
import 'package:beamer_web_advanced/Screens/profile.dart';
import 'package:beamer_web_advanced/landing_screen.dart';
import 'package:beamer_web_advanced/Screens/settings.dart';
import 'package:flutter/material.dart';

class HomeLocation extends BeamLocation<BeamState> {
  HomeLocation(RouteInformation routeInformation) : super(routeInformation);
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
          key: ValueKey('home-${DateTime.now()}'),
          child: const LandingScreen()),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/*'];
}

class DashboardLocation extends BeamLocation<BeamState> {
  DashboardLocation(RouteInformation routeInformation)
      : super(routeInformation);
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
          key: ValueKey('Dashboard'),
          child: Dashboard(),
          type: BeamPageType.fadeTransition),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/dashboard*'];
}

class SettingsLocation extends BeamLocation<BeamState> {
  SettingsLocation(RouteInformation routeInformation) : super(routeInformation);
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
          key: ValueKey('Settings'),
          child: Settings(),
          type: BeamPageType.fadeTransition),
      if (state.pathPatternSegments.contains('account'))
        const BeamPage(
          key: ValueKey('Settings-account'),
          child: AccountSettings(),
          type: BeamPageType.slideRightTransition,
        ),
      if (state.pathPatternSegments.contains('profile'))
        const BeamPage(
          key: ValueKey('Settings-profile'),
          child: ProfileSettings(),
          type: BeamPageType.slideRightTransition,
        ),
    ];
  }

  @override
  List<Pattern> get pathPatterns =>
      ['/settings*', '/settings/account', '/settings/profile'];
}

class ProfileLocation extends BeamLocation<BeamState> {
  ProfileLocation(RouteInformation routeInformation) : super(routeInformation);
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey('Profile'),
        child: Profile(),
        type: BeamPageType.fadeTransition,
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/profile*'];
}

class NotificationLocation extends BeamLocation<BeamState> {
  NotificationLocation(RouteInformation routeInformation)
      : super(routeInformation);
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey('Notifications'),
        child: Notifications(),
        type: BeamPageType.fadeTransition,
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/Notifications*'];
}

class AboutLocation extends BeamLocation<BeamState> {
  AboutLocation(RouteInformation routeInformation) : super(routeInformation);
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey('About'),
        child: About(),
        type: BeamPageType.fadeTransition,
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/About*'];
}
