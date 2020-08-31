import 'package:flutter/material.dart';
import 'package:flutter_mvc/res/strings.dart';
import 'package:flutter_mvc/widgets/ui/counter/mvc/counter_page_controller.dart';

class MainController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initApplication(context);

    // we can decide here, what controller to invoke, and which screen should we show to the user
    // according to app state (is user logged in, has user seen onboarding, etc)
    return CounterPageController();
  }

  void initApplication(BuildContext context) => Strings.getInstance.init(context: context);
}