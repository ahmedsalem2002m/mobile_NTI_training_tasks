import 'package:flutter/material.dart';
enum NavigatorType {push, pushReplacement, pushAndRemoveUntil}
abstract class AppNavigator
{
  static gooTo(BuildContext context, Widget screen, {NavigatorType type = NavigatorType.push})
  {
    var pageRoute = MaterialPageRoute(builder: (_) => screen);
    switch(type)
    {
      case NavigatorType.push:
        return Navigator.push(context, pageRoute);
      case NavigatorType.pushReplacement:
        return Navigator.pushReplacement(context, pageRoute);
      case NavigatorType.pushAndRemoveUntil:
        return Navigator.pushAndRemoveUntil(context, pageRoute, (route) => false);
    }
  }

  static goBack(context)=> Navigator.pop(context);

   static void goTo(context, Widget screen) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}