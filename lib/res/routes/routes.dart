
import 'package:get/get.dart';
import 'package:quick_link/res/routes/routeNames.dart';
import 'package:quick_link/view/homeScreen.dart';
import 'package:quick_link/view/loginScreen.dart';

import '../../bindings/authbinding.dart';
import '../../view/SignupScreen.dart';
import '../../view/splaashScreen.dart';

class AppRoutes {
  static appRoutes() => [
    GetPage(name: RouteName.splashScreen, page: () { return SplashScreen(); }, transition: Transition.fadeIn,transitionDuration: Duration(milliseconds: 800)),
    GetPage(name: RouteName.signup, page: () { return SignupScreen(); },binding: AuthBinding(), transition: Transition.fadeIn,transitionDuration: Duration(milliseconds: 800)),
    GetPage(name: RouteName.login, page: () { return LoginScreen(); },binding: AuthBinding(), transition: Transition.fadeIn,transitionDuration: Duration(milliseconds: 800)),
    GetPage(name: RouteName.homeScreen, page: () { return HomeScreen(); },binding: AuthBinding(), transition: Transition.fadeIn,transitionDuration: Duration(milliseconds: 800)),
      ];
}
